package com.qq.utils
{
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.display.IBlitDisplayObject;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.card.model.templates.CardChestAvatarTemp;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public final class QBlitBoneUtil
   {
      
      public static var debugToTD:Boolean = false;
       
      
      public function QBlitBoneUtil()
      {
         super();
      }
      
      public static function updateSourceAndVisible(param1:BlitBoneAnim, param2:TDPlantStaticInfo, param3:int = 0, param4:Boolean = false, param5:Boolean = true) : void
      {
         var _loc6_:int = 0;
         var _loc7_:String = null;
         param1.data = BlitBoneManager.impl.getBoneDataByUrl(param2.baseInfo.getResFileUrl(param3),param4);
         if(param5 && param2.baseInfo.InitHideBones)
         {
            _loc6_ = 0;
            while(_loc6_ < param2.baseInfo.InitHideBones.length)
            {
               _loc7_ = param2.baseInfo.InitHideBones[_loc6_];
               param1.setBoneVisibleRule(_loc7_,false);
               _loc6_++;
            }
         }
      }
      
      public static function createAnimCt(param1:TDPlantStaticInfo, param2:Sprite, param3:Boolean = true) : BlitBoneAnim
      {
         var t:TDPlantStaticInfo = param1;
         var parent:Sprite = param2;
         var needUpdateVisible:Boolean = param3;
         var checkIdle:Function = function(param1:BlitBoneAnim):void
         {
            var labelRange:Vector.<int> = null;
            var anim:BlitBoneAnim = param1;
            if(anim.data.hasLoaded)
            {
               labelRange = anim.data.getFrameLabelRange("idle");
               if(labelRange != null)
               {
                  anim.gotoAndPlay("idle",0,Math.random() * 50);
               }
               else
               {
                  labelRange = anim.data.getFrameLabelRange("idle1");
                  if(labelRange != null)
                  {
                     anim.gotoAndPlay("idle1",0,Math.random() * 50);
                  }
                  else
                  {
                     anim.gotoAndPlay("idle2",0,Math.random() * 50);
                  }
               }
            }
            else
            {
               anim.gotoAndPlay("idle",0);
               anim.data.addEventListener(Event.COMPLETE,function():void
               {
                  checkIdle(anim);
               },false,0,true);
            }
         };
         var ct:Sprite = parent;
         var anim:BlitBoneAnim = BlitBoneManager.impl.createBoneAnim();
         QBlitBoneUtil.updateSourceAndVisible(anim,t,0,false,needUpdateVisible);
         ct.addChild(anim.asset.asset);
         checkIdle(anim);
         return anim;
      }
      
      public static function useDefaultAvatar(param1:BlitBoneAnim, param2:int, param3:Boolean = true) : void
      {
         var _loc4_:CardChestAvatarTemp;
         if(_loc4_ = CardTemplateFactory.instance.getPlantAvatarByTdPlantId(param2))
         {
            updateAvatar(param1,_loc4_,param3);
         }
      }
      
      private static function debugAvatarCheck(param1:CardChestAvatarTemp) : CardChestAvatarTemp
      {
         return param1;
      }
      
      public static function updateAvatar(param1:BlitBoneAnim, param2:CardChestAvatarTemp, param3:Boolean = true, param4:Boolean = false) : int
      {
         var _loc8_:IBlitDisplayObject = null;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc12_:* = null;
         var _loc13_:Array = null;
         var _loc14_:String = null;
         var _loc15_:String = null;
         if(debugToTD)
         {
            param3 = false;
         }
         param2 = debugAvatarCheck(param2);
         var _loc5_:Array = !!param3 ? param2.hideBonePVPList : param2.hideBoneTDList;
         var _loc6_:Vector.<String> = !!param3 ? param2.bindBonePVPList : param2.bindBoneTDList;
         var _loc7_:Boolean = false;
         if(_loc5_ && _loc5_.length > 0)
         {
            _loc9_ = 0;
            while(_loc9_ < _loc5_.length)
            {
               _loc10_ = _loc5_[_loc9_];
               param1.setBoneVisibleRule(_loc10_,false);
               _loc9_++;
            }
            _loc7_ = true;
         }
         else
         {
            param1.clearAllBoneVisibleRules();
         }
         param1.setBoneVisibleRule(TDConstant.Ground_LayerName,false);
         param1.setBoneVisibleRule(TDConstant.Ground_LayerName2,false);
         param1.offsetY = param2.offsetY;
         param1.updateAutoPosition();
         if(_loc6_ && _loc6_.length > 0)
         {
            param1.data.partOuterBindRuleDataAutoMergeTexture = param4;
            _loc9_ = 0;
            while(_loc9_ < _loc6_.length)
            {
               _loc11_ = _loc6_[_loc9_];
               _loc12_ = param1.data.url.substring(0,param1.data.url.lastIndexOf("/")) + "/" + _loc11_ + ".bpart";
               _loc12_ = UrlManager.getUrl(0,_loc12_);
               _loc14_ = (_loc13_ = _loc11_.split("&"))[2];
               _loc15_ = _loc13_[1];
               if(_loc9_ == 0)
               {
                  param1.clearBoneOuterBindReadRule(_loc15_);
               }
               if(_loc14_)
               {
                  param1.addBoneOuterBindRule(_loc15_,_loc14_);
                  param1.data.loadUrl(_loc12_);
               }
               _loc9_++;
            }
         }
         return !!_loc7_ ? 1 : 0;
      }
   }
}
