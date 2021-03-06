package com.ithaca.visu.controls.users
{
	import com.ithaca.visu.events.UserEvent;
	import com.ithaca.visu.ui.utils.RightStatus;
	import com.ithaca.visu.model.User;
	import com.ithaca.visu.model.vo.ProfileDescriptionVO;
	import com.ithaca.visu.model.vo.UserVO;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayList;
	import mx.controls.Image;
	
	import spark.components.Button;
	import spark.components.DropDownList;
	import spark.components.Label;
	import spark.components.TextInput;
	import spark.components.supportClasses.SkinnableComponent;
	
	[SkinSate("normal")]
	[SkinSate("edit")]
	[SkinSate("pending")]
	
	public class UserDetail extends SkinnableComponent
	{
		[SkinPart("true")]
		public var firstnameInput : TextInput;
		
		[SkinPart("true")]
		public var firstnameDisplay : Label;
		
		[SkinPart("true")]
		public var lastnameInput : TextInput;
		
		[SkinPart("true")]
		public var lastnameDisplay : Label;
		
		[SkinPart("true")]
		public var emailInput : TextInput;
		[SkinPart("true")]
		public var emailDisplay : Label;
		
		[SkinPart("true")]
		public var passwordInput : TextInput;
		
		[SkinPart("true")]
		public var passwordDisplay : Label;

		[SkinPart("true")]
		public var avatarUser : Image;
		
		[SkinPart("true")]
		public var profileList : DropDownList;
		
		[SkinPart("true")]
		public var profileDisplay : Label;
		
		[SkinPart("true")]
		public var cancelButton : Button;
		
		[SkinPart("true")]
		public var saveButton : Button;
		
		[SkinPart("true")]
		public var editButton : Button;
		
		[SkinPart("true")]
		public var deleteButton : Button;
		
		 
		
		
		private var pending : Boolean; 
		
		
		public function UserDetail()
		{
			super();
		}
		
		
		//_____________________________________________________________________
		//
		// Overriden Methods
		//
		//_____________________________________________________________________
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName,instance);
			if (instance == editButton)
			{
				editButton.addEventListener(MouseEvent.CLICK, editButton_clickHandler);
				editButton.enabled = false; 
			}
			if (instance == saveButton)
			{
				saveButton.addEventListener(MouseEvent.CLICK, saveButton_clickHandler);
			}
			if (instance ==  cancelButton)
			{
				cancelButton.addEventListener(MouseEvent.CLICK, cancelButton_clickHandler);
			}
			if (instance == profileList)
			{
				profileList.dataProvider = new ArrayList(_profiles);
			}
			if (instance == deleteButton )
			{
				deleteButton.addEventListener(MouseEvent.CLICK, deleteButton_clickHandler);
				deleteButton.enabled = false;
			}
			if (instance == firstnameInput)
			{
				if( _user.id_user == 0)
				{
					firstnameInput.setFocus();
				}
			}
		}
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName,instance);
			if (instance == editButton)
			{
				editButton.removeEventListener(MouseEvent.CLICK, editButton_clickHandler);
			}
			if (instance == saveButton)
			{
				saveButton.removeEventListener(MouseEvent.CLICK, saveButton_clickHandler);
			}
			if (instance ==  cancelButton)
			{
				cancelButton.removeEventListener(MouseEvent.CLICK, cancelButton_clickHandler);
			}
			if (instance == deleteButton )
			{
				deleteButton.removeEventListener(MouseEvent.CLICK, deleteButton_clickHandler);
			}
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			if (profileList && profilesChanged)
			{
				profileList.dataProvider = new ArrayList(_profiles);
				profilesChanged = false;
			}
			if (userChanged)
			{
				if( user )
				{
					editButton.enabled = true; 
					deleteButton.enabled = false;
				}
				if ( getCurrentSkinState() == "normal")
					setDisplay();
				else
					setInput();
				userChanged = true;
			}
		}
		
		override protected function getCurrentSkinState():String
		{
			return !enabled ? "disabled" : pending ? "pending" : _editing ?  "edit" : "normal"; 
		}
		//_____________________________________________________________________
		//
		// Event Handlers
		//
		//_____________________________________________________________________
				
		/**
		 * @private
		 */
		protected function editButton_clickHandler(event:MouseEvent):void
		{
			_editing = true;
			invalidateSkinState();
			
		}
		
		/**
		 * @private
		 */
		protected function saveButton_clickHandler(event:MouseEvent):void
		{
			pending = true;
			var u:UserVO = new UserVO();
			u.firstname = firstnameInput.text;
			u.lastname = lastnameInput.text;
			u.mail = emailInput.text;
			u.password = passwordInput.text;
			u.profil = RightStatus.numberToBinary(profileList.selectedItem.profile);
			u.id_user = _user.id_user;
			u.avatar = _user.avatar;
			
			if(u.id_user == 0)
			{
				var userEventAdd:UserEvent = new UserEvent(UserEvent.ADD_USER);
				u.avatar = "https://wave.google.com/wave/static/images/unknown.jpg";
				userEventAdd.userVO = u;
				
				dispatchEvent( userEventAdd );
			}else
			{
				var userEventUpdate:UserEvent = new UserEvent(UserEvent.UPDATE_USER);
				userEventUpdate.userVO = u;
				dispatchEvent( userEventUpdate );
			}
			invalidateSkinState();
		}
		
		/**
		 * @private
		 */
		protected function deleteButton_clickHandler(event:MouseEvent):void
		{
			//pending = true;
			var u:UserVO = new UserVO();
			u.id_user = _user.id_user;
			var userEventDelete:UserEvent = new UserEvent(UserEvent.DELETE_USER);
			userEventDelete.userVO = u;
			dispatchEvent( userEventDelete );
		//	invalidateSkinState();
			
		}
		
		
		/**
		 * @private
		 */
		protected function cancelButton_clickHandler(event:MouseEvent):void
		{
			pending = false; _editing=false;
			
			//Reset textInput value
			lastnameInput.text = user.lastname;
			lastnameDisplay.text = user.lastname;
			
			firstnameInput.text = user.firstname;
			firstnameDisplay.text = user.firstname;
			
			emailInput.text = user.mail;
			emailDisplay.text = user.mail;
			
			passwordInput.text = user.password;
			passwordDisplay.text = user.password;
			
			avatarUser.source = user.avatar;
			
			updateProfileList();
			profileDisplay.text = getProfile(user.role).short_description;
			
			invalidateSkinState();
		}
		

		
		/*
		 *
		 * Methods
		 * 
		 */
		/**
		 * @private 
		 */
		protected function setInput():void
		{
			lastnameInput.text = user.lastname;			
			firstnameInput.text = user.firstname;			
			emailInput.text = user.mail;
			passwordInput.text = user.password;
			avatarUser.source = user.avatar;
			updateProfileList();
		}
		protected function setDisplay():void
		{
			lastnameDisplay.text = user.lastname;
			firstnameDisplay.text = user.firstname;
			emailDisplay.text = user.mail;
			passwordDisplay.text = user.password;
			avatarUser.source = user.avatar;
			profileDisplay.text = getProfile(user.role).short_description;
			
		}
		
		/**
		 * @private
		 */
		protected function updateProfileList():void
		{
			var profile:ProfileDescriptionVO = getProfile(user.role);
			
			if (profileList.selectedItem != profile) 
			{
				profileList.selectedItem = profile;
			}
		}
		
		/**
		 * @private
		 */
		protected function getProfile(userProfil:int):ProfileDescriptionVO
		{
			var lastProfile:ProfileDescriptionVO = profiles[0];
			for each (var p:ProfileDescriptionVO in profiles)
			{
				if(userProfil < p.profile || userProfil == p.profile ) 
				{
					return p; 
				}
				else
				{
					 
					lastProfile = p;
				}
			} 
			return lastProfile;
		}
		
		
		
 		private var _profiles:Array = [];
		private var profilesChanged : Boolean;
		[Bindable("update")]
		public function get profiles():Array {return _profiles;}
		public function set profiles(value:Array):void
		{
			if( value && value != _profiles )
			{
				_profiles = value;
				profilesChanged = true;
				invalidateProperties();
				dispatchEvent( new Event("update") );
			}
		} 
		
		private var _user : User; 
		private var userChanged : Boolean;
		[Bindable("update")]
		public function get user():User { return _user; }
		public function set user(value:User):void 
		{
			if (_user != value)
			{
				_user = value;
				userChanged = true;
				invalidateProperties();
				dispatchEvent( new Event("update") );
			}
			if( _user.id_user == 0)
			{
				if (firstnameInput) firstnameInput.setFocus();
			}
		}
		
		private var _editing : Boolean; 
		public function set editing(value:Boolean):void
		{
			_editing = true;
			invalidateSkinState();
		}
		
		public function setStateNormal():void{
			pending = false;
			_editing = false;
			invalidateSkinState();
		}
		
		
		
	}
}