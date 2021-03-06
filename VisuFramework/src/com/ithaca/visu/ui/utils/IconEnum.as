/**
 * Copyright Université Lyon 1 / Université Lyon 2 (2009,2010)
 * 
 * <ithaca@liris.cnrs.fr>
 * 
 * This file is part of Visu.
 * 
 * This software is a computer program whose purpose is to provide an
 * enriched videoconference application.
 * 
 * Visu is a free software subjected to a double license.
 * You can redistribute it and/or modify since you respect the terms of either 
 * (at least one of the both license) :
 * - the GNU Lesser General Public License as published by the Free Software Foundation; 
 *   either version 3 of the License, or any later version. 
 * - the CeCILL-C as published by CeCILL; either version 2 of the License, or any later version.
 * 
 * -- GNU LGPL license
 * 
 * Visu is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * Visu is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with Visu.  If not, see <http://www.gnu.org/licenses/>.
 * 
 * -- CeCILL-C license
 * 
 * This software is governed by the CeCILL-C license under French law and
 * abiding by the rules of distribution of free software.  You can  use, 
 * modify and/ or redistribute the software under the terms of the CeCILL-C
 * license as circulated by CEA, CNRS and INRIA at the following URL
 * "http://www.cecill.info". 
 * 
 * As a counterpart to the access to the source code and  rights to copy,
 * modify and redistribute granted by the license, users are provided only
 * with a limited warranty  and the software's author,  the holder of the
 * economic rights,  and the successive licensors  have only  limited
 * liability. 
 * 
 * In this respect, the user's attention is drawn to the risks associated
 * with loading,  using,  modifying and/or developing or reproducing the
 * software by the user in light of its specific status of free software,
 * that may mean  that it is complicated to manipulate,  and  that  also
 * therefore means  that it is reserved for developers  and  experienced
 * professionals having in-depth computer knowledge. Users are therefore
 * encouraged to load and test the software's suitability as regards their
 * requirements in conditions enabling the security of their systems and/or 
 * data to be ensured and,  more generally, to use and operate it in the 
 * same conditions as regards security. 
 * 
 * The fact that you are presently reading this means that you have had
 * knowledge of the CeCILL-C license and that you accept its terms.
 * 
 * -- End of licenses
 */
package com.ithaca.visu.ui.utils
{
	

	public class IconEnum
	{	
		import com.ithaca.traces.model.TraceModel;
		
		[Bindable]
		[Embed("images/marqueurBlanc-bas-20px.png")]
		static private var markerIcon:Class;
		
		[Bindable]
		[Embed("images/messageChat.png")]
		static private var messageChatIcon:Class;
		
		[Bindable]
		[Embed("images/motCleVisu1.png")]
		static private var keywordIcon:Class;
		
		[Bindable]
		[Embed("images/video.jpg")]
		static private var videoIcon:Class;
		
		[Bindable]
		[Embed("images/chatMessageVisu1.png")]
		static private var messageChatIconVisu1:Class;
		
		[Bindable]
		[Embed("images/consigneVisu1.png")]
		static private var consigneIconVisu1:Class;
		
		[Bindable]
		[Embed("images/fichierVisu1.png")]
		static private var fichierIconVisu1:Class;
		
		[Bindable]
		[Embed("images/CommentVer4.png")]
		static private var comment:Class;

		[Bindable]
		[Embed("images/CommentAddVer1.png")]
		static private var commentAdd:Class;

		[Bindable]
		[Embed("images/SharedThisToOtherVer1.png")]
		static private var sharedOkThisToOther:Class;
		
		[Bindable]
		[Embed("images/SharedOtherToThisVer1.png")]
		static private var sharedOkOtherToThis:Class;

		[Bindable]
		[Embed("images/SharedThisToOtherRedVer1.png")]
		static private var sharedNonThisToOther:Class;
		
		[Bindable]
		[Embed("images/SharedOtherToThisRedVer1.png")]
		static private var sharedNonOtherToThis:Class;
		
		[Bindable]
		[Embed("images/PlayVer4.png")]
		static private var playPlayer:Class;
		
		[Bindable]
		[Embed("images/PauseVer4.png")]
		static private var pausePlayer:Class;
		
		[Bindable]
		[Embed("images/StopVer4.png")]
		static private var stopPlayer:Class;

		[Bindable]
		[Embed("images/PlayWalkOutVer5.png")]
		static private var playWalkOutPlayer:Class;
		
		[Bindable]
		[Embed("images/PressSliderVer5.png")]
		static private var pressSlider:Class;

		[Bindable]
		[Embed("images/ReleaseSliderVer5.png")]
		static private var releaseSlider:Class;
		// icon Statement composant

		[Bindable]
		[Embed("images/ArrowUp.png")]
		static private var arrowUp:Class;

		[Bindable]
		[Embed("images/ArrowDown.png")]
		static private var arrowDown:Class;

		[Bindable]
		[Embed("images/Poubelle.png")]
		static private var poubelle:Class;

		[Bindable]
		[Embed("images/Editer.png")]
		static private var edit:Class;
		
		[Bindable]
		[Embed("images/add.png")]
		static private var add:Class;

		[Bindable]
		[Embed("images/RetroDocumentAddVer1.png")]
		static private var retroDocumentAdd:Class;
		
		[Bindable]
		//[Embed("images/RetroDocumentPartageVer1.png")]
		//[Embed("images/share_icon.png")]
		[Bindable]
		[Embed("images/share_icon20x20.png")]
		static private var retroDocumentShared:Class;
		
		[Bindable]
		[Embed("images/share_icon.png")]
		static private var commentForSession:Class;

		[Bindable]
		[Embed("images/RetroDocumentSegmentAddVer1.png")]
		static private var retroDocumentSegemntAdd:Class;
		
		[Bindable]
		[Embed("images/save_edit.png")]
		static private var save:Class;
		
		[Bindable]
		[Embed("images/Attention_yellow.png")]
		static private var attentionYellow:Class;
		
		[Bindable]
		[Embed("images/ballGrey.png")]
		static private var ballGrey:Class;
		
		[Bindable]
		[Embed("images/ballBlue.png")]
		static private var ballBlue:Class;
		
		[Bindable]
		[Embed("images/ballRed.png")]
		static private var ballRed:Class;
		
		[Bindable]
		[Embed("images/ballGreen.png")]
		static private var ballGreen:Class;
		
		[Bindable]
		[Embed("images/iconZoom_16x16.png")]
		static private var zoom16x16:Class;
		
		[Bindable]
		[Embed("images/iconChat_16x16.png")]
		static private var chat16x16:Class;
		
		[Bindable]
		[Embed("images/iconVolume_16x16.png")]
		static private var volume16x16:Class;
		
		[Bindable]
		[Embed("images/iconMute_16x16.png")]
		static private var mute16x16:Class;
		
		[Bindable]
		[Embed("images/mic_on.png")]
		static private var mic_on:Class;
		
		[Bindable]
		[Embed("images/mic_off.png")]
		static private var mic_off:Class;
		
		[Bindable]
		[Embed("images/iconMax_16x16.png")]
		static private var iconMax_16x16:Class;
		
		[Bindable]
		[Embed("images/playWhiteTriangle_16x16.png")]
		static private var playWhiteTriangle_16x16:Class;
		[Bindable]
		[Embed("images/recordWhiteRectangle_16x16.png")]
		static private var recordWhiteRectangle_16x16:Class;
		[Bindable]
		[Embed("images/recordRedBall_16x16.png")]
		static private var recordRedBall_16x16:Class;
		
		[Bindable]
		[Embed("images/dragDropPlace_16x8.png")]
		static private var dragDropPlace_16x8:Class;
		[Bindable]
		[Embed("images/deleteRoundIcon_16x16.png")]
		static private var deleteRoundIcon_16x16:Class;
		
		[Bindable]
		[Embed("images/ScreenShot80x60.png")]
		static private var ScreenShot80x60:Class;
		
		[Bindable]
		[Embed("images/iconVideo_16x16.png")]
		static private var iconVideo_16x16:Class;
		[Bindable]
		[Embed("images/iconPlay_16x16.png")]
		static private var iconPlay_16x16:Class;
		[Bindable]
		[Embed("images/iconPause_16x16.png")]
		static private var iconPause_16x16:Class;
		[Bindable]
		[Embed("images/iconEdit_16x16.png")]
		static private var iconEdit_16x16:Class;
		[Bindable]
		[Embed("images/iconStop_16x16.png")]
		static private var iconStop_16x16:Class;
		[Bindable]
		[Embed("images/iconAudio_16x16.png")]
		static private var iconAudio_16x16:Class;
		[Bindable]
		[Embed("images/iconMinimaze_16x16.png")]
		static private var iconMinimaze_16x16:Class;
		[Bindable]
		[Embed("images/iconSave_16x16.png")]
		static private var iconSave_16x16:Class;
		[Bindable]
		[Embed("images/iconPlayGreen_16x16.png")]
		static private var iconPlayGreen_16x16:Class;
		[Bindable]
		[Embed("images/iconRecordBorder_16x16.png")]
		static private var iconRecordBorder_16x16:Class;
		[Bindable]
		[Embed("images/iconStopRed_16x16.png")]
		static private var iconStopRed_16x16:Class;
		[Bindable]
		[Embed("images/iconStopYellow_16x16.png")]
		static private var iconStopYellow_16x16:Class;
		[Bindable]
		[Embed("images/deleteRoundIconRed_16x16.png")]
		static private var deleteRoundIconRed_16x16:Class;
		[Bindable]
		[Embed("images/iconOption_16x16.png")]
		static private var iconOption_16x16:Class;
		[Bindable]
		[Embed("images/iconPauseYellow_16x16.png")]
		static private var iconPauseYellow_16x16:Class;
		[Bindable]
		[Embed("images/iconLettre_t__16x16.png")]
		static private var iconLettre_t_16x16:Class;
		[Bindable]
		[Embed("images/iconLettre_T_16x16.png")]
		static private var iconLettre_T_16x16:Class;
		[Bindable]
		[Embed("images/iconReturnLeft_16x16.png")]
		static private var iconReturnLeft_16x16:Class;
		[Bindable]
		[Embed("images/iconInfo_16x16.png")]
		static private var iconInfo_16x16:Class;
		[Bindable]
		[Embed("images/RetroDocumentAddSegmentWithArrow_16x16.png")]
		static private var RetroDocumentAddSegmentWithArrow_16x16:Class;
		[Bindable]
		[Embed("images/loaderBlueLine.swf")]
		static private var loaderBlueLine:Class;
		[Bindable]
		[Embed("images/iconEye_16x16.png")]
		static private var iconEye_16x16:Class;
		[Bindable]
		[Embed("images/iconAnnuler_16x16.png")]
		static private var iconAnnuler_16x16:Class;
		[Bindable]
		[Embed("images/iconValider_16x16.png")]
		static private var iconValider_16x16:Class;
		[Bindable]
		[Embed("images/tree.png")]
		static private var tree:Class;
		
		public static function getPathByName(code:String):String
		{
			var path:String = "";
			switch (code)
			{
			case "commentForSession" : 
				path = "images/share_icon.png";
				break;
			case "video" : 
				path = "images/video.jpg";
				break;
			}
			return path;
		}
		public static function getIconByTypeObsel(code:String):Class
		{
			var icon:Class;
			switch (code)
			{
				case TraceModel.SET_MARKER: 
				case TraceModel.RECEIVE_MARKER: 
					icon = markerIcon;
					break;
				case TraceModel.SEND_CHAT_MESSAGE: 
				case TraceModel.RECEIVE_CHAT_MESSAGE: 
					icon = messageChatIconVisu1;
					break;
				case TraceModel.SEND_KEYWORD: 
				case TraceModel.RECEIVE_KEYWORD: 
					icon = keywordIcon;
					break;
				case TraceModel.SEND_INSTRUCTIONS: 
				case TraceModel.RECEIVE_INSTRUCTIONS: 
					icon = consigneIconVisu1;
					break;
				case TraceModel.SEND_DOCUMENT: 
				case TraceModel.RECEIVE_DOCUMENT: 
				case TraceModel.READ_DOCUMENT: 
					icon = videoIcon;
					break;
				case TraceModel.PLAY_VIDEO: 
					icon = playPlayer;
					break;
				case TraceModel.PAUSE_VIDEO: 
					icon = pausePlayer;
					break;
				case TraceModel.END_VIDEO: 
					icon = stopPlayer;
					break;
				case TraceModel.STOP_VIDEO: 
					icon = playWalkOutPlayer;
					break;
				case TraceModel.PRESS_SLIDER_VIDEO: 
					icon = pressSlider;
					break;
				case TraceModel.RELEASE_SLIDER_VIDEO: 
					icon = releaseSlider;
					break;
				case TraceModel.SET_TEXT_COMMENT: 
					icon = comment;
					break;
				default :
					break;				
			}
			return icon;
		}
		
		public static function getIconByCodeShared(code:String):Class
		{
			var icon:Class;
			switch (code)
			{
				case SharedSatusEnum.SHARED_OK_THIS_TO_OTHER : 
					icon = sharedOkThisToOther;
					break;
				case SharedSatusEnum.SHARED_OK_OTHER_TO_THIS : 
					icon = sharedOkThisToOther;
				//	icon = sharedOkOtherToThis;
					break;
				case SharedSatusEnum.SHARED_NON_THIS_TO_OTHER : 
					icon = sharedNonThisToOther;
					break;
				case SharedSatusEnum.SHARED_NON_OTHER_TO_THIS : 
					icon = sharedNonThisToOther;
				//	icon = sharedNonOtherToThis;
					break;
				default :
					break;				
			}
			return icon;
		}
		
		public static function getIconByName(code:String):Class
		{
			var icon:Class;
			
			switch (code)
			{
				case "up" : 
					icon = arrowUp;
					break;
				case "down" : 
					icon = arrowDown;
					break;
				case "delete" : 
					icon = poubelle;
					break;
				case "edit" : 
					icon = edit;
					break;
				case "commentAdd" : 
					icon = commentAdd;
					break;
				case "add" : 
					icon = add;
					break;
				case "retroDocumentAdd" : 
					icon = retroDocumentAdd;
					break;
				case "retroDocumentShared" : 
					icon = retroDocumentShared;
					break;
				case "retroDocumentSegemntAdd" : 
					icon = retroDocumentSegemntAdd;
					break;
				case "save" : 
					icon = save;
					break;
				case "attention" : 
					icon = attentionYellow;
					break;
				case "ballGreen" : 
					icon = ballGreen;
					break;
				case "ballRed" : 
					icon = ballRed;
					break;
				case "ballGrey" : 
					icon = ballGrey;
					break;
				case "ballBlue" : 
					icon = ballBlue;
					break;
				case "zoom" : 
					icon = zoom16x16;
					break;
				case "chat" : 
					icon = chat16x16;
					break;
				case "volume" : 
					icon = volume16x16;
					break;
				case "mute" : 
					icon = mute16x16;
					break;
				case "micOn" : 
					icon = mic_on;
					break;
				case "micOff" : 
					icon = mic_off;
					break;
				case "max" : 
					icon = iconMax_16x16;
					break;
				case "audioRecorderWhiteTriangle" : 
					icon = playWhiteTriangle_16x16;
					break;
				case "audioRecorderWhiteRectangle" : 
					icon = recordWhiteRectangle_16x16;
					break;
				case "audioRecorderRedBall" : 
					icon = recordRedBall_16x16;
					break;
				case "dragDropFlag" : 
					icon = dragDropPlace_16x8;
					break;
				case "deleteRoundIcon" : 
					icon = deleteRoundIcon_16x16;
					break;
				case "ScreenShot80x60" : 
					icon = ScreenShot80x60;
					break;
				case "iconVideo_16x16" : 
					icon = iconVideo_16x16;
					break;
				case "iconPlay_16x16" : 
					icon = iconPlay_16x16;
					break;
				case "iconPause_16x16" : 
					icon = iconPause_16x16;
					break;
				case "iconEdit_16x16" : 
					icon = iconEdit_16x16;
					break;
				case "iconStop_16x16" : 
					icon = iconStop_16x16;
					break;
				case "iconAudio_16x16" : 
					icon = iconAudio_16x16;
					break;
				case "iconMinimaze_16x16" : 
					icon = iconMinimaze_16x16;
					break;
				case "iconSave_16x16" : 
					icon = iconSave_16x16;
					break;
				case "iconPlayGreen_16x16" : 
					icon = iconPlayGreen_16x16;
					break;
				case "iconRecordBorder_16x16" : 
					icon = iconRecordBorder_16x16;
					break;
				case "iconStopRed_16x16" : 
					icon = iconStopRed_16x16;
					break;
				case "iconStopYellow_16x16" : 
					icon = iconStopYellow_16x16;
					break;
				case "deleteRoundIconRed_16x16" : 
					icon = deleteRoundIconRed_16x16;
					break;
				case "iconOption_16x16" : 
					icon = iconOption_16x16;
					break;
				case "iconPauseYellow_16x16" : 
					icon = iconPauseYellow_16x16;
					break;
				case "iconLettre_t_16x16" : 
					icon = iconLettre_t_16x16;
					break;
				case "iconLettre_T_16x16" : 
					icon = iconLettre_T_16x16;
					break;
				case "iconReturnLeft_16x16" : 
					icon = iconReturnLeft_16x16;
					break;
				case "iconInfo_16x16" : 
					icon = iconInfo_16x16;
					break;
				case "RetroDocumentAddSegmentWithArrow_16x16" : 
					icon = RetroDocumentAddSegmentWithArrow_16x16;
					break;
				case "loaderBlueLine" : 
					icon = loaderBlueLine;
					break;
				case "iconEye_16x16" : 
					icon = iconEye_16x16;
					break;
				case "iconAnnuler_16x16" : 
					icon = iconAnnuler_16x16;
					break;
				case "iconValider_16x16" : 
					icon = iconValider_16x16;
					break;
				case "tree" : 
					icon = tree;
					break;
				default :
					break;				
			}
			return icon;
		}
	}
}