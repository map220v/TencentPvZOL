package com.qq.modules.mapinfo.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Text;
   import asgui.managers.PopUpManager;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.friend.model.vo.FriendRoleVo;
   import com.qq.modules.map.model.vo.MapCityCellVO;
   import com.qq.modules.union.view.UnionFlagView;
   import com.qq.utils.UrlManager;
   import com.qq.utils.ui.TipTextInput;
   import com.tencent.protobuf.Int64;
   
   public class MapInfoRoleWnd extends MapInfoRoleWndCE
   {
      
      public static var instance:MapInfoRoleWnd;
       
      
      public var histories:Vector.<MapInfoDetailItemRenderer>;
      
      public var txtTip:Text;
      
      public var textinput_my_word:TipTextInput;
      
      public var vo:MapCityCellVO;
      
      public var allianceIcon:UnionFlagView;
      
      public var friendVo:FriendRoleVo;
      
      public var challengeObj:Object;
      
      public var roleId:Int64;
      
      public var img_challenge_back:Image;
      
      public var img_challenge_icon:Image;
      
      public var txtChallengeHonor:Text;
      
      public function MapInfoRoleWnd(param1:MapCityCellVO = null, param2:Int64 = null, param3:FriendRoleVo = null, param4:Object = null)
      {
         this.roleId = param2;
         this.vo = param1;
         this.friendVo = param3;
         this.challengeObj = param4;
         instance = this;
         super();
      }
      
      override public function InitializeComponent() : void
      {
         var _loc1_:int = 0;
         super.InitializeComponent();
         this.boxBtns.SetStyle("horizontalAlign","center");
         this.imgStamp.alpha = 0.5;
         this.txtLevel.SetStyle("textAlign","center");
         this.txtAlliance.SetStyle("color","#ffff00");
         this.txtAlliance.SetStyle("fontSize","14");
         this.txtAlliance.SetStyle("textDecoration","underline");
         this.txtAlliance.buttonMode = true;
         this.txtPos.buttonMode = true;
         this.txtPos.SetStyle("textDecoration","underline");
         this.histories = new Vector.<MapInfoDetailItemRenderer>(3,true);
         _loc1_ = 0;
         while(_loc1_ < this.histories.length)
         {
            this.histories[_loc1_] = new MapInfoDetailItemRenderer(UrlManager.getUrl(0,"swf/mapinfo/detail_short_back.png"),444,false);
            this.histories[_loc1_].setRoleInfoStyle();
            this.boxHistories.addChild(this.histories[_loc1_]);
            _loc1_++;
         }
         this.img_challenge_back = new Image();
         this.img_challenge_back.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/back.png");
         addChild(this.img_challenge_back);
         this.img_challenge_back.x = 256;
         this.img_challenge_back.y = 26;
         this.img_challenge_icon = new Image();
         this.img_challenge_icon.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/icon_1.png");
         addChild(this.img_challenge_icon);
         this.img_challenge_icon.x = 258;
         this.img_challenge_icon.y = 31;
         this.txtChallengeHonor = new Text();
         this.txtChallengeHonor.SetStyle("color","#ffff00");
         this.txtChallengeHonor.SetStyle("fontSize","14");
         this.txtChallengeHonor.width = 170;
         addChild(this.txtChallengeHonor);
         this.txtChallengeHonor.x = 211;
         this.txtChallengeHonor.y = 86;
         this.txtTip = new Text();
         this.txtTip.x = 20;
         this.txtTip.y = 140;
         this.txtTip.width = 430;
         this.addChild(this.txtTip);
         this.allianceIcon = new UnionFlagView(true,false);
         this.allianceIcon.x = txtAlliance.x - 35;
         this.allianceIcon.y = txtAlliance.y - 4;
         canvas_85.addChild(this.allianceIcon);
         btnMail.toolTip = "写邮件";
         linkbutton_block.SetStyle("color","#FFFFFF");
         linkbutton_not_block.SetStyle("color","#FFFFFF");
         this.textinput_my_word = new TipTextInput();
         this.textinput_my_word.styleName = ".TextInput_Gray";
         this.textinput_my_word.SetStyle("fontSize","13");
         this.textinput_my_word.SetStyle("color","#f8f2ba");
         this.textinput_my_word.SetStyle("textShadowColor","#4c4535");
         this.textinput_my_word.SetStyle("textLeading","4");
         this.textinput_my_word.x = 281;
         this.textinput_my_word.y = 44;
         this.textinput_my_word.width = 179;
         this.textinput_my_word.height = 59;
         this.addChild(this.textinput_my_word);
         this.textinput_my_word.textField.wordWrap = true;
         this.textinput_my_word.maxChars = ServerConfigTemplateFactory.instance.iSignatureMaxLen;
         this.textinput_my_word.visible = false;
         button_my_word_save.visible = false;
         button_my_word_save.coolDownTime = 500;
      }
      
      public function Close() : void
      {
         PopUpManager.RemovePopUp(this);
         Dispose();
         instance = null;
      }
   }
}
