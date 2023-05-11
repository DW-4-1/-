package heesung;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class CronTriggerTest {
	private SchedulerFactory schedFact;
	private Scheduler sched;
		
	
	public CronTriggerTest() {
		try {
		schedFact = new StdSchedulerFactory();
			sched = schedFact.getScheduler();
			
			// 작업 1
			JobDetail job1 = JobBuilder.newJob(CronTestJob1.class)
					.withIdentity("cJob1", Scheduler.DEFAULT_GROUP)
					.build();
			Trigger tg1 = (Trigger) TriggerBuilder.newTrigger()
					.withIdentity("CronTrigger1", "c_group1")
					.startNow()
					.withSchedule(CronScheduleBuilder.cronSchedule("0 * * * * ?"))
//					.modifiedByCalendar("test")
					.build();
			sched.scheduleJob(job1, tg1);
			// 작업 2
			JobDetail job2 = JobBuilder.newJob(CronTestJob2.class)
					.withIdentity("cJob2", Scheduler.DEFAULT_GROUP)
					.build();
			Trigger tg2 = (Trigger) TriggerBuilder.newTrigger()
					.withIdentity("CronTrigger2", "c_group2")
					.startNow()
					.withSchedule(CronScheduleBuilder.cronSchedule("30 * * * * ?"))
					.build();
					
			sched.scheduleJob(job2, tg2);
					
			sched.start();
			
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		new CronTriggerTest();
	}
	
}
