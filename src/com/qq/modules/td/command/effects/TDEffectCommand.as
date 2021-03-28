package com.qq.modules.td.command.effects
{
   import asgui.blit.Blit;
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.data.BlitDataManager;
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.core.Application;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.IMyApplication;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.command.game.TDGameFlowCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.effects.TDEffectBulletTracer;
   import com.qq.modules.td.view.effects.TDEffectFinishing;
   import com.qq.modules.td.view.effects.TDEffectFlashHit;
   import com.qq.modules.td.view.effects.TDEffectTracer;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DMath;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDEffectCommand extends StrongRobotlegCommand
   {
      
      public static const TDEffectCommand_AddEffect_TOP:String = "TDEffectCommand_AddEffect_TOP";
      
      public static const TDEffectCommand_AddEffect_BOTTOM:String = "TDEffectCommand_AddEffect_BOTTOM";
      
      public static const TDEffectCommand_AddMc:String = "TDEffectCommand_AddMc";
      
      private static const ADJUST_POS_ARR:Array = [[0,1],[0,-1],[1,0],[-1,0],[1,1],[1,-1],[-1,1],[-1,-1]];
       
      
      public function TDEffectCommand()
      {
         super();
      }
      
      private function addClip(param1:String, param2:int, param3:int, param4:Boolean = false, param5:String = "top", param6:Boolean = false, param7:Function = null) : IBlitDisplayContainer
      {
         var c:IBlitDisplayContainer = null;
         var b:IBlitClip = null;
         var playClipAtBlitClipPlayCompleteHandler:Function = null;
         var source:String = param1;
         var x:int = param2;
         var y:int = param3;
         var loop:Boolean = param4;
         var side:String = param5;
         var ramdomStart:Boolean = param6;
         var endFunction:Function = param7;
         playClipAtBlitClipPlayCompleteHandler = function(param1:Event):void
         {
            b.removeEventListener(Event.COMPLETE,playClipAtBlitClipPlayCompleteHandler);
            b.Dispose();
            c.Dispose();
            if(endFunction != null)
            {
               endFunction.apply();
            }
         };
         c = Blit.factory.CreateBlitContainer();
         b = Blit.factory.CreateBlitClip();
         b.autoUpdatePosition = true;
         b.dataProvider = BlitDataManager.GetBlitDataByUrl(source);
         c.x = x;
         c.y = y;
         b.Play(!!loop ? 0 : 1);
         b.addEventListener(Event.COMPLETE,playClipAtBlitClipPlayCompleteHandler);
         c.AddChild(b);
         this.$doAddClip(side,c);
         if(ramdomStart)
         {
            if(b.dataProvider.hasContent)
            {
               b.currentFrame = b.dataProvider.totalFrames * Math.random();
            }
            else
            {
               var blitDataCompleteHandler:Function = function(param1:Event):void
               {
                  if(b.dataProvider)
                  {
                     b.currentFrame = b.dataProvider.totalFrames / 5 * Math.random();
                  }
               };
               b.addEventListener(Event.COMPLETE,blitDataCompleteHandler,false,0,true);
            }
         }
         return c;
      }
      
      public function playClipAt(param1:String, param2:int, param3:int, param4:Boolean = false, param5:String = "top", param6:Boolean = false, param7:Object = null, param8:Boolean = true, param9:Function = null) : void
      {
         var _loc10_:TDEffectTracer = null;
         if(param7 != null)
         {
            (_loc10_ = new TDEffectTracer(param7 as IGameObject,param8)).addClip(param1,param2,param3,!param4);
            this.$doAddClip(param5,_loc10_.asset);
         }
         else
         {
            this.addClip(param1,param2,param3,param4,param5,param6);
         }
      }
      
      public function playAnimAt(param1:String, param2:int, param3:int, param4:Boolean = false, param5:String = "top", param6:Number = 1) : void
      {
         var anim:BlitBoneAnim = null;
         var source:String = param1;
         var x:int = param2;
         var y:int = param3;
         var loop:Boolean = param4;
         var side:String = param5;
         var scale:Number = param6;
         anim = BlitBoneManager.impl.createBoneAnim();
         anim.data = BlitBoneManager.impl.getBoneDataByUrl(source);
         anim.play(!!loop ? 0 : 1);
         anim.autoUpdatePosition = true;
         var c:IBlitDisplayContainer = Blit.factory.CreateBlitContainer();
         c.x = x;
         c.y = y;
         c.mouseEnabled = false;
         c.AddChild(anim.asset);
         anim.asset.scaleX = anim.asset.scaleY = scale;
         this.$doAddClip(side,c);
         if(!loop)
         {
            anim.addEventListener(Event.COMPLETE,function(param1:Event):void
            {
               var _loc2_:IBlitDisplayContainer = anim.asset.GetParent().GetParent();
               if(_loc2_)
               {
                  _loc2_.RemoveChild(anim.asset.GetParent());
               }
               anim.Dispose();
            });
         }
      }
      
      private function $doAddClip(param1:String, param2:*) : void
      {
         switch(param1)
         {
            case "top":
               eventDispatcher.dispatchEvent(new CommonEvent(TDEffectCommand_AddEffect_TOP,param2));
               break;
            case "bottom":
               eventDispatcher.dispatchEvent(new CommonEvent(TDEffectCommand_AddEffect_BOTTOM,param2));
         }
      }
      
      public function playRewardEndAnimation() : void
      {
         CommandDispatcher.send(CommandName.TDGameEvent_HideRewardItem);
         CommandDispatcher.send(CommandName.TDGameEvent_FlyRewardItem);
         this.playTDFinishing(GameGloble.stage.stageWidth * 0.5,GameGloble.stage.stageHeight * 0.5,this.onFinishRewardEndAnimation);
      }
      
      public function onFinishRewardEndAnimation() : void
      {
         TDGameFlowCmd.reportTDResult();
      }
      
      public function playTDFinishing(param1:int, param2:int, param3:Function = null) : void
      {
         var _loc4_:TDEffectFinishing = new TDEffectFinishing(param3);
         (Application.application as IMyApplication).uiLayer.addChildAt(_loc4_,0);
         var _loc5_:Point = new Point(param1,param2);
         _loc5_ = _loc4_.parent.globalToLocal(_loc5_);
         _loc4_.x = _loc5_.x;
         _loc4_.y = _loc5_.y;
         TDSoundCmd.win();
      }
      
      public function playTraceAtGameObject(param1:*, param2:Object) : void
      {
         var _loc3_:IGameObject = param2 as IGameObject;
         var _loc4_:TDEffectBulletTracer = new TDEffectBulletTracer(_loc3_);
         eventDispatcher.dispatchEvent(new CommonEvent(TDEffectCommand_AddEffect_TOP,_loc4_.asset));
      }
      
      public function playFlashToGameObject(param1:int, param2:int, param3:Object) : void
      {
         var _loc4_:IGameObject = param3 as IGameObject;
         var _loc5_:TDEffectFlashHit = new TDEffectFlashHit(param1,param2,_loc4_);
         eventDispatcher.dispatchEvent(new CommonEvent(TDEffectCommand_AddEffect_TOP,_loc5_.asset));
      }
      
      public function playBombEffect(param1:int, param2:int, param3:int) : void
      {
         this.playBlitAnimation(param1,param2,param3);
      }
      
      public function playDirtEffect(param1:int, param2:int) : void
      {
         var _loc3_:Array = [1500,1600,1700];
         var _loc4_:int = _loc3_[Math.max(0,DMath.randNum(0,_loc3_.length - 1))];
         this.playBlitAnimation(_loc4_,param1,param2);
      }
      
      public function playZombieCharredEffect(param1:Object) : void
      {
         var _loc3_:IGameObject = null;
         var _loc2_:BasicZombie = param1 as BasicZombie;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.zombieData.zombiestaticInfo.charredType != 0)
         {
            _loc3_ = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,_loc2_.zombieData.zombiestaticInfo.charredType);
            _loc3_.objectModel.setParamValue(TDConstant.GameObjectData_Param_CharredUIN,_loc2_.uid);
            CommandDispatcher.send(CommandName.TD_Add_UnitToScreen,{
               "object":_loc3_,
               "x":_loc2_.x,
               "y":_loc2_.y
            });
         }
      }
      
      public function playArmorResistEffect(param1:Object) : void
      {
         var _loc2_:IGameObject = param1 as IGameObject;
         if(_loc2_ == null || param1.damageArea == null)
         {
            return;
         }
         if(!TDGameInfo.getInstance().isPlayZombieHitEffect(_loc2_.uid))
         {
            return;
         }
         var _loc3_:Rectangle = TDCheckCollision.getNewObjRect(_loc2_,_loc2_.damageArea);
         var _loc4_:int = _loc3_.x;
         var _loc5_:int = _loc3_.y + _loc3_.height * 0.5;
         this.playClipAt(UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,"td_effect_zombie_shield.swf"),_loc4_,_loc5_,false);
      }
      
      public function playBambooLiHitEffect(param1:Object, param2:Object) : void
      {
         var _loc3_:IGameObject = param2 as IGameObject;
         var _loc4_:IGameObject = param1 as IGameObject;
         if(_loc3_ == null || param2.damageArea == null)
         {
            return;
         }
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:Boolean = false;
         if(_loc3_.x < _loc4_.x)
         {
            _loc5_ = true;
         }
         if(!TDGameInfo.getInstance().isPlayZombieHitEffect(_loc3_.uid))
         {
            return;
         }
         var _loc6_:Rectangle;
         var _loc7_:int = (_loc6_ = TDCheckCollision.getNewObjRect(_loc3_,_loc3_.damageArea)).x;
         if(_loc5_)
         {
            _loc7_ = _loc6_.right;
         }
         var _loc8_:int = _loc6_.y + _loc6_.height * 0.5;
         var _loc9_:IGameObject = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,TDConstant.UnitType_ZombieHitEffect,null,false,_loc5_);
         CommandDispatcher.send(CommandName.TD_Add_UnitToBulletLayer,{
            "object":_loc9_,
            "x":_loc7_,
            "y":_loc8_
         });
      }
      
      public function playBlitAnimation(param1:int, param2:int, param3:int, param4:Object = null) : void
      {
         var _loc5_:IGameObject = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,param1);
         CommandDispatcher.send(CommandName.TD_Add_UnitToBulletLayer,{
            "object":_loc5_,
            "x":param2,
            "y":param3,
            "param":param4
         });
      }
      
      public function showArrowTargetEffect(param1:int, param2:int) : void
      {
         var _loc7_:IGameObject = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc3_:IGameObject = TDGameInfo.getInstance().getGameObjctByUID(param1);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,5700);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc7_ = _loc4_[_loc5_];
            if((_loc8_ = int(_loc7_.getRunningProp(TDConstant.GameObject_Prop_ArrowTargetEffect_ShooterUID))) == param2)
            {
               if((_loc9_ = _loc7_.getRunningProp(TDConstant.GameObject_Prop_ArrowTargetEffect_TargetUID)) != param1)
               {
                  this.hideArrowTargetEffect(param2);
               }
            }
            _loc5_++;
         }
         var _loc6_:IGameObject;
         (_loc6_ = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,5700)).setRunningProp(TDConstant.GameObject_Prop_ArrowTargetEffect_ShooterUID,param2);
         _loc6_.setRunningProp(TDConstant.GameObject_Prop_ArrowTargetEffect_TargetUID,param1);
         CommandDispatcher.send(CommandName.TD_Add_UnitToBulletLayer,{
            "object":_loc6_,
            "x":_loc3_.x,
            "y":_loc3_.y
         });
      }
      
      public function hideArrowTargetEffect(param1:int) : void
      {
         var _loc4_:IGameObject = null;
         var _loc2_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,5700);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if((_loc4_ = _loc2_[_loc3_]).getRunningProp(TDConstant.GameObject_Prop_ArrowTargetEffect_ShooterUID) == param1)
            {
               _loc4_.setRunningProp(TDConstant.GameObject_Prop_ArrowTargetEffect_ShooterUID,-1);
               _loc4_.setAction(TDConstant.ArrowTargetEffectHideAction);
            }
            _loc3_++;
         }
      }
      
      public function showWaterSplash(param1:int, param2:int, param3:Boolean = true) : void
      {
         var _loc4_:TDMapTileData = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param3)
         {
            if(!(_loc4_ = TDGameInfo.getInstance().getRoadTileByScreenPos(param1,param2)))
            {
               return;
            }
            param1 = _loc4_.rect.left + _loc4_.rect.width * 0.5;
            param2 = _loc4_.rect.top + _loc4_.rect.height * 0.5;
            if(_loc4_ && !TDFloorManager.instance.hasWaterAt(_loc4_.roadRow,_loc4_.roadCol))
            {
               _loc7_ = 0;
               while(_loc7_ < ADJUST_POS_ARR.length)
               {
                  _loc5_ = ADJUST_POS_ARR[_loc7_][0];
                  _loc6_ = ADJUST_POS_ARR[_loc7_][1];
                  if(TDFloorManager.instance.hasWaterAt(_loc4_.roadRow + _loc5_,_loc4_.roadCol + _loc6_))
                  {
                     param1 = _loc4_.rect.left + _loc4_.rect.width * (-_loc6_ + 0.5);
                     param2 = _loc4_.rect.top + _loc4_.rect.height * (_loc5_ + 0.5);
                     break;
                  }
                  _loc7_++;
               }
            }
         }
         this.playBlitAnimation(TDConstant.UnitType_WaterSplash,param1,param2);
      }
      
      public function showBgEffect(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:IGameObject = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,param1);
         CommandDispatcher.send(CommandName.TD_Add_UnitToGroundLayer,{
            "object":_loc4_,
            "x":param2,
            "y":param3
         });
      }
   }
}
