package  com.ithaca.documentarisation.events
{	
	import com.ithaca.documentarisation.model.RetroDocument;
	import com.ithaca.documentarisation.model.Segment;
	import com.ithaca.visu.model.Session;
	import com.ithaca.visu.model.vo.RetroDocumentVO;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class RetroDocumentEvent extends Event
	{
		// constants
		static public const PRE_REMOVE_SEGMENT : String = 'preRemoveSegment';
		static public const LOAD_TREE_RETRO_DOCUMENT : String = 'loadTreeRetroDocument';
		static public const LOAD_LIST_RETRO_DOCUMENT : String = 'loadListRetroDocument';
		static public const LOAD_RETRO_DOCUMENT : String = 'loadRetroDocument';
		static public const SHOW_RETRO_DOCUMENT : String = 'showRetroDocument';
		static public const CREATE_RETRO_DOCUMENT : String = 'createRetroDocument';
		static public const DELETE_RETRO_DOCUMENT : String = 'deleteRetroDocument';
		static public const PRE_DELETE_RETRO_DOCUMENT : String = 'preDeleteRetroDocument';
		static public const PRE_UPDATE_RETRO_DOCUMENT : String = 'preUpdateRetroDocument';
		static public const UPDATE_RETRO_DOCUMENT : String = 'updateRetroDocument';
		static public const UPDATE_RETRO_SEGMENT : String = 'updateRetroSegment';
		static public const CHANGE_RETRO_SEGMENT : String = 'changeRetroSegment';
		static public const CHANGE_TIME_BEGIN_TIME_END : String = 'changeTimeBeginTimeEnd';
		static public const UPDATE_TITLE_RETRO_DOCUMENT : String = 'updateTitleRetroDocument';
		static public const LOAD_LIST_USERS : String = 'loadListUsers';
		static public const LOADED_ALL_USERS : String = 'loadedAllUsersRetroDocument';
		static public const UPDATE_STREAM_PATH_AUDIO_COMMENT_SEGMENT_RETRO_DOCUMENT : String = 'updateStremPathAudioCommentSegmentRetroDocument';
		
		static public const PLAY_RETRO_SEGMENT : String = 'playRetroSegment';
		static public const PAUSE_RETRO_SEGMENT : String = 'pauseRetroSegment';
		static public const STOP_RETRO_SEGMENT : String = 'stopRetroSegment';
		static public const CLICK_BUTTON_SWITCH : String = 'clickButtonSwitch';
		static public const UPDATE_ADDED_RETRO_DOCUMENT : String = 'updateAddedRetroDocument';
		static public const ADD_RETRO_DOCUMENT : String = 'addRetroDocument';
		static public const GO_BILAN_MODULE_FROM_RETRO : String = 'goBilanModuleFromRetro';
		static public const GO_RETRO_MODULE_FROM_BILAN : String = 'goRetroModuleFromBilan';
		
		static public const CHANGE_LIST_RETRO_SEGMENT : String = 'changeListRetroSegment';
		static public const READY_TO_DRAG_DROP_SEGMENT : String = 'readyToDragDropSegment';
		static public const READY_TO_DRAG_DROP_OBSEL : String = 'readyToDragDropObsel';
		static public const STOP_TO_DRAG_DROP_OBSEL : String = 'stopToDragDropObsel';
		// properties
		public var segment  :Segment;
		public var xmlRetrodocument:String;
		public var listRetroDocument:ArrayCollection;
		public var idRetroDocument:int;
		public var retroDocument:RetroDocument;
		public var editabled:Boolean;
		public var retroDocumentVO:RetroDocumentVO;
		public var sessionId:int;
		public var session:Session;
		public var listUser:Array;
		public var beginTime:Number;
		public var endTime:Number;
		public var titleRetrodocument:String;
		public var statusPlaySegment:Boolean;
		public var streamPathAudioCommentSegment:String;
		
		public var value:Object;
		public var event:Object;
		
		// constructor
		public function RetroDocumentEvent(type : String,
								   bubbles : Boolean = true,
								   cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		// methods
	}
}
