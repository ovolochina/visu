package business
{

import com.ithaca.visu.events.SessionEvent;
import com.ithaca.visu.events.UserEvent;
import com.lyon2.visu.model.Model;
import com.lyon2.visu.vo.SessionVO;

import flash.events.IEventDispatcher;

import mx.collections.ArrayCollection;
import mx.logging.ILogger;
import mx.logging.Log;


public class HomeManager
{
	// properties
	
	[Bindable]
	public var connectedUsers : ArrayCollection;

	/*[Bindable]
	public var listSessionDate : ArrayCollection = new ArrayCollection();
	*/
	[Bindable]
	public var fluxActivity : ArrayCollection;
	
	[Bindable]
	public var listSessionView:ArrayCollection;

	
	private var logger : ILogger = Log.getLogger('HomeManager');
	
	private var dispatcher:IEventDispatcher;
	
	// constructor
	public function HomeManager(dispatcher:IEventDispatcher)
	{
		this.dispatcher = dispatcher;
	}

	// methods
	/**
	 * Set date list
	 */ 
/*	public function onLoadListSessionsDates(arSessionDates:Object):void{
		
		// FIXME PROBLEME TOO TIMES CALL THIS FUNCTION, EXISTE TOO MAPS !!!!!
		if( Model.getInstance().getSessionDate().length == 0)
		{
			Model.getInstance().setSessionDate(arSessionDates.data);
			this.listSessionDate = Model.getInstance().getSessionDate();
			
			var elementDateStartToday:Object = getObjectDateSessionStartToday(this.listSessionDate);
			var labelDate:String = elementDateStartToday.labelDate;
			Model.getInstance().setSelectedItemNavigateurDayByLoggedUser(elementDateStartToday);
			
			var sessionEventLoad:SessionEvent = new SessionEvent(SessionEvent.LOAD_LIST_SESSION);
			sessionEventLoad.userId = Model.getInstance().getLoggedUser().id_user;
			sessionEventLoad.sessionDate = labelDate;
			this.dispatcher.dispatchEvent(sessionEventLoad);
		}
	}*/
	

	
	/**
	 * Set session list, call for each date  
	 */ 
	/*public function onLoadListSessionByDate(listSession:Object, sessionDate:String):void{
		// get all users how will participate in session of logged user
		var listSessionByDate:Array = listSession.data as Array;
		Model.getInstance().setListSessionsByDate(listSessionByDate, sessionDate);
		var nbrSession:uint = listSessionByDate.length;
		for(var nSession:uint = 0; nSession < nbrSession ; nSession++)
		{
			var event:UserEvent = new UserEvent(UserEvent.LOAD_LIST_USERS_SESSION);
			event.sessionId = listSessionByDate[nSession].id_session;
			event.sessionDate = sessionDate;
			dispatcher.dispatchEvent(event);			
		}		
	}*/
	
	/**
	 * Set user list for a session
	 */ 
	public function onLoadListUsersSession(listUsers: Array, sessionId : int, sessionDate: String):void
	{
		// set users session
	    Model.getInstance().setListUsersSession(listUsers, sessionId);
		
		var sessionEvent:SessionEvent = new SessionEvent(SessionEvent.UPDATE_LIST_SESSION);
		var listSession:ArrayCollection = Model.getInstance().getListSessionByDate(sessionDate);
		
		sessionEvent.listSession = listSession;
		sessionEvent.sessionDate = sessionDate;
		dispatcher.dispatchEvent(sessionEvent);	
	}
	
	/**
	 * init flux activity
	 */ 
	public function getFluxActivity():void{
		// initialisation flux activity
		this.fluxActivity = Model.getInstance().getFluxActivity();
	}


	public function onError(session:Object = null):void{
		
	}

}
}