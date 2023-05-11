package heesung;

import static org.quartz.JobBuilder.newJob;

import java.beans.EventHandler;

import org.quartz.DateBuilder;
import org.quartz.DateBuilder.IntervalUnit;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class SimpleTriggerTest {

	public static void main(String[] args) throws SchedulerException {
		
		SchedulerFactory sdf = new StdSchedulerFactory();
    	Scheduler sched = sdf.getScheduler();
    	
    	
    	JobDetail jd = newJob(SimpleTriggerJob.class)
    			.withIdentity("stjob", Scheduler.DEFAULT_GROUP)
    			.build();
    	
    	Trigger trigger = TriggerBuilder.newTrigger()
    			.withIdentity("SimpleTrigger", "group1")
//    			.startNow()
    			.startAt(DateBuilder.futureDate(5, IntervalUnit.SECOND))
    			.endAt(DateBuilder.futureDate(6, IntervalUnit.SECOND))
    			.withSchedule(SimpleScheduleBuilder.simpleSchedule()
		    			.withIntervalInSeconds(1)
		    			.withRepeatCount(5)
//		    			.repeatForever()
		    			)
    			.build();
    	
    	sched.scheduleJob(jd, trigger);
    	
    	sched.start();
	}
}
