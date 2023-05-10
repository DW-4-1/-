package heesung;

import java.util.Date;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class TestJob implements Job {
    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
    	int time;
    	if (condition) {
			
		}
        System.out.println( + "경과 " + new Date(System.currentTimeMillis()) + "]"); 
    }
}