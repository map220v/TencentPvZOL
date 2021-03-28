package com.qq.modules.chat.view.helpers
{
   import PVZ.Cmd.ChannelType;
   import PVZ.Cmd.ObjInfoType;
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.constant.bag.BagItemUtil;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.chat.ChatGlobals;
   import com.qq.modules.chat.model.vo.ChatSentenceVO;
   import com.qq.modules.hole.model.HoleTemplateFactory;
   import com.qq.modules.hole.model.templates.HoleUseTypeTemplate;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.roleInfo.privilege.PrivilegeIcon;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.UrlManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flashx.textLayout.elements.FlowElement;
   import flashx.textLayout.elements.InlineGraphicElement;
   import flashx.textLayout.elements.LinkElement;
   import flashx.textLayout.elements.ParagraphElement;
   import flashx.textLayout.elements.SpanElement;
   import flashx.textLayout.formats.TextDecoration;
   
   public final class ChatUtils
   {
      
      private static var linkHoverFontFormat:Object = {"color":16711680};
      
      private static var linkNormalFontFormat:Object = {"color":16747008};
      
      public static const EMOTION_COUNT:int = 28;
      
      private static var defaultSplitReg:RegExp = /(@\d{3}|\{event:.*?\})/;
       
      
      public function ChatUtils()
      {
         super();
      }
      
      public static function ConvertSentenceVOToPara(param1:ChatSentenceVO) : ParagraphElement
      {
         var _loc4_:FlowElement = null;
         var _loc2_:ParagraphElement = new ParagraphElement();
         var _loc3_:Vector.<FlowElement> = ConvertSignElement(param1);
         for each(_loc4_ in _loc3_)
         {
            _loc2_.addChild(_loc4_);
         }
         ConvertSentenceContentToParaElement(_loc2_,param1.content);
         _loc2_.color = getChannelContentColor(param1);
         return _loc2_;
      }
      
      private static function ConvertSignElement(param1:ChatSentenceVO) : Vector.<FlowElement>
      {
         var _loc3_:FlowElement = null;
         var _loc4_:SpanElement = null;
         var _loc2_:Vector.<FlowElement> = new Vector.<FlowElement>();
         switch(param1.channelType)
         {
            case ChannelType.ChannelType_System:
               _loc3_ = createFlowElement("ChatUI_systemIcon");
               _loc2_.push(_loc3_);
               break;
            case ChannelType.ChannelType_Whisper:
               if(param1.isMyMsg)
               {
                  _loc3_ = createLinkName("密[" + param1.targetName + "]：",getChannelSignColor(param1),ChatGlobals.CHAT_LINK_CLICK_EVENT,ObjInfoType.E_ObjInfoType_ChatRoleInfo + "|" + param1.targetId + "|" + param1.targetName);
               }
               else
               {
                  _loc3_ = createLinkName("[" + param1.srcRoleNick + "]密：",getChannelSignColor(param1),ChatGlobals.CHAT_LINK_CLICK_EVENT,ObjInfoType.E_ObjInfoType_ChatRoleInfo + "|" + param1.srcRoleId.toString() + "|" + param1.srcRoleNick);
               }
               _loc2_.push(_loc3_);
               break;
            case ChannelType.ChannelType_LocalError:
               break;
            default:
               if(param1.channelType == ChannelType.ChannelType_Horn)
               {
                  _loc3_ = createFlowElement("ChatUI_HornIcon",7);
                  _loc2_.push(_loc3_);
               }
               if(param1.vipType)
               {
                  _loc2_.push(createVipElement(param1.vipType));
               }
               if(param1.isBlueDiamond)
               {
                  _loc2_.push(createPrivilegeElement(param1));
               }
               addPrefixFlag(param1,_loc2_);
               if(param1.isMyMsg)
               {
                  _loc3_ = new SpanElement();
                  (_loc3_ as SpanElement).text = "[".concat(param1.srcRoleNick,"]：");
               }
               else if(param1.srcRoleId == null)
               {
                  _loc3_ = new SpanElement();
                  (_loc3_ as SpanElement).text = "[公告]：";
               }
               else
               {
                  _loc3_ = createLinkName("[".concat(param1.srcRoleNick,"]："),getChannelSignColor(param1),ChatGlobals.CHAT_LINK_CLICK_EVENT,ObjInfoType.E_ObjInfoType_ChatRoleInfo + "|" + param1.srcRoleId.toString() + "|" + param1.srcRoleNick);
               }
               _loc2_.push(_loc3_);
         }
         if(_loc3_)
         {
            _loc3_.color = getChannelSignColor(param1);
         }
         return _loc2_;
      }
      
      private static function addPrefixFlag(param1:ChatSentenceVO, param2:Vector.<FlowElement>) : void
      {
         if(param2 == null)
         {
            return;
         }
         switch(param1.channelType)
         {
            case ChannelType.ChannelType_ExpeditionFightSection:
            case ChannelType.ChannelType_ExpeditionFightSide:
               if(GameGloble.isExpeditionLeader(param1.srcRoleId))
               {
                  param2.push(createExpeditionLeaderElement(param1));
               }
         }
      }
      
      private static function createFlowElement(param1:String, param2:Number = 5) : InlineGraphicElement
      {
         var _loc3_:InlineGraphicElement = new InlineGraphicElement();
         var _loc4_:Sprite;
         (_loc4_ = AssetManager.GetNewClass(param1) as Sprite).y = param2;
         (_loc3_ as InlineGraphicElement).source = _loc4_;
         return _loc3_;
      }
      
      private static function createPrivilegeElement(param1:ChatSentenceVO) : InlineGraphicElement
      {
         var _loc2_:Sprite = null;
         var _loc5_:PrivilegeIcon = null;
         _loc2_ = new Sprite();
         _loc2_.mouseChildren = false;
         var _loc3_:int = 20;
         if(ExternalVars.PlatformFlag != ExternalVars.SFROM_QZONE)
         {
            (_loc5_ = PrivilegeIcon.create()).privilege = param1.privilegeDiamond;
            _loc5_.extraParam = param1.growLevel;
            _loc3_ = _loc5_.width;
            _loc2_.addChild(_loc5_);
         }
         _loc2_.graphics.beginFill(0,0);
         _loc2_.graphics.drawRect(0,0,_loc3_,15);
         _loc2_.graphics.endFill();
         _loc2_.y = 5;
         var _loc4_:InlineGraphicElement;
         (_loc4_ = new InlineGraphicElement()).source = _loc2_;
         return _loc4_;
      }
      
      private static function createExpeditionLeaderElement(param1:ChatSentenceVO) : InlineGraphicElement
      {
         var _loc2_:Image = new Image();
         _loc2_.width = 36;
         _loc2_.height = 18;
         _loc2_.y = 5;
         _loc2_.source = UrlManager.getUrl(0,"swf/chat/leader.png");
         var _loc3_:InlineGraphicElement = new InlineGraphicElement();
         _loc3_.source = _loc2_;
         return _loc3_;
      }
      
      private static function createVipElement(param1:int) : InlineGraphicElement
      {
         var _loc2_:Image = new Image();
         _loc2_.width = 20;
         _loc2_.height = 18;
         _loc2_.y = 5;
         switch(param1)
         {
            case 1:
               _loc2_.source = UrlManager.getUrl(0,"swf/chat/VIP1.png");
               break;
            case 2:
               _loc2_.source = UrlManager.getUrl(0,"swf/chat/VIP2.png");
               break;
            case 3:
               _loc2_.source = UrlManager.getUrl(0,"swf/chat/VIP3.png");
         }
         var _loc3_:InlineGraphicElement = new InlineGraphicElement();
         _loc3_.source = _loc2_;
         return _loc3_;
      }
      
      private static function createLinkName(param1:String, param2:String, param3:String, param4:String = null) : LinkElement
      {
         var _loc5_:LinkElement = new LinkElement();
         var _loc6_:SpanElement;
         (_loc6_ = new SpanElement()).text = param1;
         _loc6_.textDecoration = TextDecoration.NONE;
         _loc5_.addChild(_loc6_);
         _loc5_.href = "event:" + param3;
         _loc5_.target = param4;
         _loc5_.linkNormalFormat = {"color":param2};
         _loc5_.linkHoverFormat = linkHoverFontFormat;
         return _loc5_;
      }
      
      private static function getChannelSignColor(param1:ChatSentenceVO) : String
      {
         var _loc2_:String = null;
         switch(param1.channelType)
         {
            case ChannelType.ChannelType_Whisper:
               _loc2_ = "#CC00CC";
               break;
            case ChannelType.ChannelType_System:
               _loc2_ = "#F6E100";
               break;
            case ChannelType.ChannelType_Guild:
               _loc2_ = "#32AAFF";
               break;
            case ChannelType.ChannelType_ExpeditionFightSection:
               _loc2_ = "#FFFF00";
               break;
            case ChannelType.ChannelType_ExpeditionFightSide:
               if(GameGloble.isExpeditionLeader(param1.srcRoleId))
               {
                  _loc2_ = "#32AAFF";
               }
               else
               {
                  _loc2_ = "#FFFFFF";
               }
               break;
            case ChannelType.ChannelType_ExpeditionFightSystem:
               if(GameGloble.isExpeditionLeader(param1.srcRoleId))
               {
                  _loc2_ = "#32AAFF";
               }
               else
               {
                  _loc2_ = "#FFFFFF";
               }
               break;
            default:
               _loc2_ = !!param1.isMyMsg ? "#00FF12" : "#FF8A00";
         }
         return _loc2_;
      }
      
      private static function getChannelContentColor(param1:ChatSentenceVO) : String
      {
         var _loc2_:String = null;
         switch(param1.channelType)
         {
            case ChannelType.ChannelType_Whisper:
               _loc2_ = "#CC00CC";
               break;
            case ChannelType.ChannelType_System:
               _loc2_ = "#FFE400";
               break;
            case ChannelType.ChannelType_LocalError:
               _loc2_ = "#FF0000";
               break;
            case ChannelType.ChannelType_Guild:
               _loc2_ = "#32B419";
               break;
            case ChannelType.ChannelType_ExpeditionFightSection:
               _loc2_ = "#FFFF00";
               break;
            case ChannelType.ChannelType_ExpeditionFightSide:
               if(GameGloble.isExpeditionLeader(param1.srcRoleId))
               {
                  _loc2_ = "#FFE92F";
               }
               else
               {
                  _loc2_ = "#00FFFF";
               }
               break;
            case ChannelType.ChannelType_ExpeditionFightSystem:
               if(GameGloble.isExpeditionLeader(param1.srcRoleId))
               {
                  _loc2_ = "#FFE92F";
               }
               else
               {
                  _loc2_ = "#F6E100";
               }
            default:
               _loc2_ = "#FFFFFF";
         }
         return _loc2_;
      }
      
      public static function ConvertSentenceContentToParaElement(param1:ParagraphElement, param2:String) : ParagraphElement
      {
         var _loc4_:FlowElement = null;
         if(!param1)
         {
            param1 = new ParagraphElement();
         }
         var _loc3_:Vector.<FlowElement> = ConvertSentenceContent(param2);
         for each(_loc4_ in _loc3_)
         {
            param1.addChild(_loc4_);
         }
         return param1;
      }
      
      public static function ConvertSentenceContent(param1:String, param2:RegExp = null) : Vector.<FlowElement>
      {
         var _loc5_:FlowElement = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:Sprite = null;
         if(param2 == null)
         {
            param2 = defaultSplitReg;
         }
         var _loc3_:Vector.<FlowElement> = new Vector.<FlowElement>();
         var _loc4_:Array = param1.split(param2);
         for each(_loc6_ in _loc4_)
         {
            if(!(_loc6_ == null || _loc6_ == ""))
            {
               if(_loc6_.charAt(0) == "@")
               {
                  if((_loc7_ = int(_loc6_.slice(1))) > 0 && _loc7_ <= EMOTION_COUNT)
                  {
                     _loc5_ = new InlineGraphicElement();
                     (_loc8_ = AssetManager.GetNewClass("ChatEmo_" + _loc7_) as Sprite).y = 5;
                     (_loc5_ as InlineGraphicElement).source = _loc8_;
                  }
                  else
                  {
                     ((_loc5_ = new SpanElement()) as SpanElement).text = _loc6_;
                  }
               }
               else if(_loc6_.slice(0,7) == "{event:" && _loc6_.charAt(_loc6_.length - 1) == "}")
               {
                  _loc5_ = createLinkItem(_loc6_);
               }
               else
               {
                  (_loc5_ = new SpanElement()).fontFamily = "SimSun,Microsoft YaHei";
                  (_loc5_ as SpanElement).text = _loc6_;
               }
               _loc3_.push(_loc5_);
            }
         }
         return _loc3_;
      }
      
      private static function createLinkItem(param1:String) : FlowElement
      {
         var _loc5_:FlowElement = null;
         var _loc6_:LinkElement = null;
         param1 = param1.slice(7).replace("}","");
         var _loc2_:Array = param1.split("|");
         var _loc3_:int = _loc2_[0];
         var _loc4_:Boolean = true;
         switch(_loc3_)
         {
            case ObjInfoType.E_ObjInfoType_CardFullInfo:
               (_loc5_ = createLinkItemCard(_loc2_)).textDecoration = TextDecoration.NONE;
               break;
            case ObjInfoType.E_ObjInfoType_ItemInfo:
               (_loc5_ = createLinkItemEquip(_loc2_)).textDecoration = TextDecoration.NONE;
               break;
            case ObjInfoType.E_ObjInfoType_ChatRoleInfo:
            case ObjInfoType.E_ObjInfoType_TopFightHistoryRoleInfo:
               (_loc5_ = createLinkItemRole(_loc2_)).textDecoration = TextDecoration.UNDERLINE;
               break;
            case ObjInfoType.E_ObjInfoType_TempleInfo:
               (_loc5_ = createLinkItemDefault(_loc2_[5])).textDecoration = TextDecoration.UNDERLINE;
               break;
            case ObjInfoType.E_ObjInfoType_GuildInfo:
               (_loc5_ = createLinkItemDefault(_loc2_[1])).textDecoration = TextDecoration.UNDERLINE;
               break;
            case ObjInfoType.E_ObjInfoType_BattleRecorder:
               (_loc5_ = createLinkItemDefault(_loc2_[2] + " vs " + _loc2_[3])).textDecoration = TextDecoration.UNDERLINE;
               break;
            case ObjInfoType.E_ObjInfoType_TreasureHouse:
               (_loc5_ = createLinkItemDefault(_loc2_[1])).textDecoration = TextDecoration.UNDERLINE;
               break;
            case ObjInfoType.E_ObjInfoType_Text:
               _loc5_ = createLinkItemDefault(_loc2_[1]);
               _loc4_ = false;
               break;
            case ObjInfoType.E_ObjInfoType_GuardInfo:
               _loc5_ = createHoleLink(_loc2_);
               break;
            case ObjInfoType.E_ObjInfoType_ClientFlag:
               _loc5_ = createClientFlag(_loc2_);
         }
         if(_loc4_)
         {
            (_loc6_ = new LinkElement()).addChild(_loc5_);
            _loc6_.href = "event:" + ChatGlobals.CHAT_LINK_CLICK_EVENT;
            _loc6_.target = param1;
            _loc6_.linkHoverFormat = linkHoverFontFormat;
            _loc6_.linkNormalFormat = linkNormalFontFormat;
            return _loc6_;
         }
         return _loc5_;
      }
      
      private static function createClientFlag(param1:Array) : SpanElement
      {
         var _loc2_:SpanElement = new SpanElement();
         _loc2_.text = param1[2];
         _loc2_.color = 16752926;
         _loc2_.textDecoration = "underline";
         return _loc2_;
      }
      
      private static function createLinkItemRole(param1:Array) : SpanElement
      {
         var _loc2_:SpanElement = new SpanElement();
         _loc2_.text = param1[2];
         return _loc2_;
      }
      
      private static function createLinkItemDefault(param1:String) : SpanElement
      {
         var _loc2_:SpanElement = new SpanElement();
         _loc2_.text = param1;
         _loc2_.color = 3320575;
         return _loc2_;
      }
      
      private static function createLinkItemCard(param1:Array) : InlineGraphicElement
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.mouseChildren = false;
         var _loc3_:Sprite = AssetManager.GetNewClass("ChatUI_itemBg") as Sprite;
         _loc2_.addChild(_loc3_);
         var _loc4_:TextField;
         (_loc4_ = new TextField()).embedFonts = true;
         var _loc5_:TextFormat;
         (_loc5_ = new TextFormat()).font = "hkhb";
         _loc5_.size = 16;
         _loc5_.color = 55295;
         _loc4_.defaultTextFormat = _loc5_;
         _loc4_.text = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(param1[1]).name;
         _loc4_.height = 20;
         _loc4_.width = _loc4_.textWidth + 5;
         _loc4_.x = 5;
         _loc4_.y = 0;
         _loc2_.addChild(_loc4_);
         var _loc6_:Sprite;
         (_loc6_ = AssetManager.GetNewClass("ChatUI_starImg") as Sprite).x = _loc4_.x + _loc4_.width;
         _loc6_.y = 3;
         _loc2_.addChild(_loc6_);
         var _loc7_:TextField;
         (_loc7_ = new TextField()).embedFonts = true;
         var _loc8_:TextFormat;
         (_loc8_ = new TextFormat()).font = "hkhb";
         _loc8_.size = 14;
         _loc8_.color = 15793920;
         _loc7_.defaultTextFormat = _loc8_;
         _loc7_.text = "x" + BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(param1[1]).star;
         _loc7_.height = 20;
         _loc7_.width = _loc7_.textWidth + 5;
         _loc7_.x = _loc6_.x + 15;
         _loc7_.y = 0;
         _loc2_.addChild(_loc7_);
         _loc3_.width = _loc7_.x + _loc7_.width + 5;
         var _loc9_:BitmapData;
         (_loc9_ = new BitmapData(_loc2_.width,_loc2_.height,true,0)).draw(_loc2_);
         var _loc10_:Bitmap;
         (_loc10_ = new Bitmap(_loc9_)).y = 5;
         var _loc11_:InlineGraphicElement;
         (_loc11_ = new InlineGraphicElement()).source = _loc10_;
         return _loc11_;
      }
      
      private static function createLinkItemEquip(param1:Array) : InlineGraphicElement
      {
         var _loc2_:int = int(param1[1]);
         var _loc3_:Sprite = new Sprite();
         _loc3_.mouseChildren = false;
         var _loc4_:Sprite = AssetManager.GetNewClass("ChatUI_itemBg") as Sprite;
         _loc3_.addChild(_loc4_);
         var _loc5_:Image = new Image();
         _loc5_.scaleX = _loc5_.scaleY = 0.4;
         _loc5_.x = 5;
         _loc5_.y = 0;
         _loc5_.source = BagItemUtil.getBagItemImageSource(_loc2_);
         _loc3_.addChild(_loc5_);
         var _loc6_:TextField;
         (_loc6_ = new TextField()).embedFonts = true;
         var _loc7_:TextFormat;
         (_loc7_ = new TextFormat()).font = "hkhb";
         _loc7_.size = 14;
         _loc7_.color = 55295;
         _loc6_.defaultTextFormat = _loc7_;
         _loc6_.text = ItemTemplateFactory.instance.getBagItemTemplateById(_loc2_).name;
         _loc6_.height = 20;
         _loc6_.width = _loc6_.textWidth + 5;
         _loc6_.x = 25;
         _loc6_.y = 0;
         _loc3_.addChild(_loc6_);
         _loc4_.width = _loc6_.x + _loc6_.width + 10;
         _loc3_.y = 5;
         var _loc8_:InlineGraphicElement;
         (_loc8_ = new InlineGraphicElement()).source = _loc3_;
         return _loc8_;
      }
      
      private static function createHoleLink(param1:Array) : InlineGraphicElement
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.mouseChildren = false;
         var _loc3_:HoleUseTypeTemplate = HoleTemplateFactory.instance.getHoleType(param1[2]);
         var _loc4_:Image;
         (_loc4_ = new Image()).scaleX = 0.4;
         _loc4_.scaleY = 0.4;
         _loc4_.source = BagItemUtil.getBagItemImageSource(_loc3_.useItemID);
         _loc4_.x = 88;
         _loc4_.y = 6;
         _loc2_.addChild(_loc4_);
         var _loc5_:TextField;
         (_loc5_ = new TextField()).embedFonts = true;
         var _loc6_:TextFormat;
         (_loc6_ = new TextFormat()).font = "hkhb";
         _loc6_.size = 14;
         _loc6_.color = 55295;
         _loc5_.defaultTextFormat = _loc6_;
         _loc5_.htmlText = FontHKHB.HOLE_CHAT_BAR;
         _loc5_.height = 20;
         _loc5_.width = _loc5_.textWidth;
         _loc5_.y = 7;
         _loc2_.addChild(_loc5_);
         var _loc7_:InlineGraphicElement;
         (_loc7_ = new InlineGraphicElement()).source = _loc2_;
         return _loc7_;
      }
      
      public static function filterHornChannelStr(param1:String) : String
      {
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:String = param1.replace(/@.*\|.*@/,"");
         var _loc3_:Array = _loc2_.split(/(@\d{3}|\{event:.*?\})/);
         var _loc4_:int;
         if((_loc4_ = _loc3_.length) > 1)
         {
            _loc5_ = 0;
            for(; _loc5_ < _loc4_; _loc5_++)
            {
               if(!((_loc6_ = _loc3_[_loc5_]).substr(0,7) == "{event:" && _loc6_.charAt(_loc6_.length - 1) == "}"))
               {
                  continue;
               }
               _loc9_ = (_loc8_ = (_loc7_ = _loc6_.slice(7).replace("}","")).split("|"))[0];
               switch(_loc9_)
               {
                  case ObjInfoType.E_ObjInfoType_ChatRoleInfo:
                  case ObjInfoType.E_ObjInfoType_TopFightHistoryRoleInfo:
                     _loc3_[_loc5_] = "<font color=\'#ffa11e\'>" + _loc8_[2] + "</font>";
                     break;
                  case ObjInfoType.E_ObjInfoType_Text:
                     _loc3_[_loc5_] = "<font color=\'#ffa11e\'>" + _loc8_[1] + "</font>";
                     break;
               }
            }
            _loc2_ = _loc3_.join("");
         }
         return _loc2_;
      }
      
      public static function filterOtherChanelStr(param1:String) : String
      {
         var _loc6_:String = null;
         var _loc7_:String = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Array = param1.match(/@.*\|.*@/);
         if(_loc2_ == null || _loc2_.length == 0)
         {
            return param1;
         }
         var _loc3_:String = param1;
         var _loc4_:int = _loc2_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = (_loc6_ = _loc2_[_loc5_]).substr(1,_loc6_.length - 2);
            _loc7_ = "{event:" + ObjInfoType.E_ObjInfoType_ClientFlag + "|".concat(_loc7_,"}");
            _loc3_ = _loc3_.replace(_loc6_,_loc7_);
            _loc5_++;
         }
         return _loc3_;
      }
   }
}
