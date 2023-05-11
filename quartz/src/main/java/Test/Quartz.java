package Test;

import static org.quartz.CronScheduleBuilder.cronSchedule;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

@WebServlet("/Quartz.do")
public class Quartz extends HttpServlet{
	
    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    		// 스케줄러를 생성하는 데 사용된다.
    		SchedulerFactory schedulerFactory = new StdSchedulerFactory();
    		
    		try {
    			// 팩토리의 인스턴스를 통해 스케줄러를 생성한다.
    			Scheduler scheduler = schedulerFactory.getScheduler();
    			
    			// testjob 클래스의 작업을 정하기 위해 jobdetail 인스턴스를 생성한다.
    			JobDetail job = newJob(TestJob.class)
    					.withIdentity("jobName", Scheduler.DEFAULT_GROUP)
    					.build();
    			
    			// trigger는 job이 언제 실행될지 구성하는 객체이다.
    			Trigger trigger = TriggerBuilder.newTrigger()
    					.withIdentity("trigger1", "group1")
    					.startNow()
    					.withSchedule(SimpleScheduleBuilder.simpleSchedule()
    					.withIntervalInSeconds(10)
    					.repeatForever())
    					.build();
    			
    			// 스케줄러를 통해 트리거가 동작되면 job이 실행되게 한다.
    			scheduler.scheduleJob(job, trigger);
    			scheduler.start();
    			
    			PrintWriter out = res.getWriter();
    			
    			out.println("<p>" + TestJob.elapsedTime + "</p>");
    			
    		} catch(Exception e) {
    			e.printStackTrace();
    		}
    		
    		
    	}
    	
    	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}