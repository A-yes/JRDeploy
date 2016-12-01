package me.zingon.JRDeploy.service;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;
import ch.ethz.ssh2.StreamGobbler;
import me.zingon.JRDeploy.model.JRDeploy;
import me.zingon.JRDeploy.util.ConMap;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

/**
 * Created by ZTC on 12/1/2016.
 */
@Service
public class SshService {

    @Value("${sh.init.get}")
    String initGet;

    @Value("${sh.init.start}")
    String initStart;

    public boolean checkSsh(String host,String port,String user,String password) throws IOException {
        Connection con=new Connection(host,Integer.parseInt(port));
        con.connect();
        boolean result=con.authenticateWithPassword(user,password);
        if(result){
            ConMap.putCon(host+"_"+port,con);
        }
        return result;
    }

    public String execCommand(String host,String port,String command) throws IOException {
        StringBuilder sb=new StringBuilder();
        Connection con=ConMap.getCon(host+"_" +port);
        Session session=con.openSession();
        session.execCommand(command);
        InputStream inerr=new StreamGobbler(session.getStderr());
        BufferedReader brerr=new BufferedReader(new InputStreamReader(inerr));
        InputStream in=new StreamGobbler(session.getStdout());
        BufferedReader br=new BufferedReader(new InputStreamReader(in));
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line.toString());
            sb.append(System.getProperty("line.separator"));
        }
        while ((line = brerr.readLine()) != null) {
            sb.append(line.toString());
            sb.append(System.getProperty("line.separator"));
        }
        in.close();
        inerr.close();
        br.close();
        brerr.close();
        session.close();
        return sb.toString();
    }

    public String deploy(String host, String port, JRDeploy jrDeploy) throws IOException {
        StringBuilder sb=new StringBuilder();
        sb.append(execCommand(host,port,initGet));
        sb.append(execCommand(host,port,initStart+" "+jrDeploy.getJrdPath()+" "+jrDeploy.getUuid()));
        sb.append(execCommand(host,port,"sh "+jrDeploy.getJrdPath()
                                +"/"+jrDeploy.getUuid()+"/shell/package.sh "
                                +jrDeploy.getJrdPath()+" "
                                +jrDeploy.getUuid()+" "
                                +jrDeploy.getType()+" "
                                +jrDeploy.getUrl()+" "
                                +jrDeploy.getBranch()+" "
                                +jrDeploy.getProfile()+" "
                                +jrDeploy.getModule()+" "
                                +jrDeploy.getContextPath()+" "
                                +jrDeploy.getJettyPath())
        );
        return sb.toString();
    }

}
