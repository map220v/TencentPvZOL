package com.qq.modules.td.logic.miniGame.jewels
{
   import com.gems.GemBase;
   import com.gems.GemWar;
   import com.gems.IGemEffector;
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import com.qq.modules.sound.command.SoundCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDMiniGameJewelsData;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   
   public class JewelsEffector implements IGemEffector
   {
       
      
      public function JewelsEffector()
      {
         super();
      }
      
      public function playExchangeFailed(param1:GemWar, param2:GemBase, param3:GemBase, param4:Function) : void
      {
         var _loc12_:TweenMax = null;
         var _loc13_:TweenMax = null;
         var _loc5_:JewelBase = param2 as JewelBase;
         var _loc6_:JewelBase = param3 as JewelBase;
         var _loc7_:BasicPlant = _loc5_.getEffectTarget() as BasicPlant;
         var _loc8_:BasicPlant = _loc6_.getEffectTarget() as BasicPlant;
         var _loc9_:Number = 0.3;
         var _loc10_:Point = this.getTargetPoint(_loc6_);
         if(_loc7_)
         {
            _loc12_ = TweenMax.to(_loc7_,_loc9_,{
               "x":_loc10_.x,
               "y":_loc10_.y,
               "repeat":1,
               "yoyo":true,
               "onUpdate":_loc5_.onMoving
            });
         }
         var _loc11_:Point = this.getTargetPoint(_loc5_);
         if(_loc8_)
         {
            _loc13_ = TweenMax.to(_loc8_,_loc9_,{
               "x":_loc11_.x,
               "y":_loc11_.y,
               "repeat":1,
               "yoyo":true,
               "onUpdate":_loc6_.onMoving,
               "onComplete":param4
            });
         }
         else
         {
            TweenMax.delayedCall(_loc9_,param4);
         }
      }
      
      public function playExchangeSucceed(param1:GemWar, param2:GemBase, param3:GemBase, param4:Vector.<GemBase>, param5:Function) : void
      {
         var jewelA:JewelBase = null;
         var jewelB:JewelBase = null;
         var playExchangeDisappear:Function = null;
         var playDisappearCompletedHandler:Function = null;
         var tweenA:TweenMax = null;
         var tweenB:TweenMax = null;
         var gemWar:GemWar = param1;
         var gemA:GemBase = param2;
         var gemB:GemBase = param3;
         var result:Vector.<GemBase> = param4;
         var playCompletedHandler:Function = param5;
         playExchangeDisappear = function():void
         {
            playDisappear(result,playDisappearCompletedHandler);
         };
         playDisappearCompletedHandler = function():void
         {
            jewelA.isMove = false;
            jewelB.isMove = false;
            playCompletedHandler.call();
         };
         jewelA = gemA as JewelBase;
         jewelB = gemB as JewelBase;
         var plantA:BasicPlant = jewelA.getEffectTarget() as BasicPlant;
         var plantB:BasicPlant = jewelB.getEffectTarget() as BasicPlant;
         var time:Number = 0.3;
         var cache1X:Number = !!plantB ? Number(plantB.x) : Number(0);
         var cache1Y:Number = !!plantB ? Number(plantB.y) : Number(0);
         if(plantA)
         {
            tweenA = TweenMax.to(plantA,time,{
               "x":cache1X,
               "y":cache1Y,
               "onUpdate":jewelA.onMoving
            });
         }
         var cache2X:Number = !!plantA ? Number(plantA.x) : Number(0);
         var cache2Y:Number = !!plantA ? Number(plantA.y) : Number(0);
         if(plantB)
         {
            tweenB = TweenMax.to(plantB,time,{
               "x":cache2X,
               "y":cache2Y,
               "onUpdate":jewelB.onMoving,
               "onComplete":playExchangeDisappear
            });
         }
         else
         {
            TweenMax.delayedCall(time,playExchangeDisappear);
         }
         jewelA.isMove = true;
         jewelB.isMove = true;
      }
      
      public function playFallEffect(param1:GemWar, param2:Vector.<GemBase>, param3:Vector.<GemBase>, param4:Function) : void
      {
         var i:int = 0;
         var j:int = 0;
         var gem:GemBase = null;
         var myTween:TweenLite = null;
         var num:int = 0;
         var pos:Point = null;
         var target:Object = null;
         var fallCompletedHandler:Function = null;
         var newCompletedHandler:Function = null;
         var cacheIdy:int = 0;
         var myGemWar:GemWar = param1;
         var fallGems:Vector.<GemBase> = param2;
         var addGems:Vector.<GemBase> = param3;
         var playCompletedHandler:Function = param4;
         fallCompletedHandler = function():void
         {
            var _loc1_:int = 0;
            while(_loc1_ < fallGems.length)
            {
               gem = fallGems[_loc1_];
               gem.isMove = false;
               _loc1_++;
            }
         };
         newCompletedHandler = function():void
         {
            var _loc1_:int = 0;
            while(_loc1_ < addGems.length)
            {
               gem = addGems[_loc1_];
               gem.isMove = false;
               _loc1_++;
            }
            playCompletedHandler.call();
         };
         var duration:Number = 0.5;
         var cacheArr:Array = [];
         num = fallGems.length;
         i = 0;
         while(i < num)
         {
            gem = fallGems[i];
            pos = this.getTargetPoint(gem);
            target = gem.getEffectTarget();
            gem.isMove = true;
            if(target)
            {
               TweenLite.to(gem.getEffectTarget(),duration,{
                  "x":pos.x,
                  "y":pos.y,
                  "onUpdate":gem.onMoving,
                  "onComplete":fallCompletedHandler
               });
            }
            i++;
         }
         i = 0;
         while(i < myGemWar.col)
         {
            cacheArr[i] = -1;
            i++;
         }
         addGems = addGems.sort(this.sortGem);
         num = addGems.length;
         i = 0;
         while(i < addGems.length)
         {
            gem = addGems[i];
            cacheIdy = gem.idy;
            gem.create(gem.idx,cacheIdy,true);
            gem.getEffectTarget().y = gem.getEffectTarget().y - (gem.idy - cacheArr[gem.idx]) * gem.gemHeight;
            --cacheArr[gem.idx];
            pos = this.getTargetPoint(gem);
            target = gem.getEffectTarget();
            gem.isMove = true;
            if(i == num - 1)
            {
               if(target)
               {
                  TweenLite.to(gem.getEffectTarget(),duration,{
                     "x":pos.x,
                     "y":pos.y,
                     "onUpdate":gem.onMoving,
                     "onComplete":newCompletedHandler
                  });
               }
               else
               {
                  TweenLite.delayedCall(duration,newCompletedHandler);
               }
            }
            else if(target)
            {
               TweenLite.to(gem.getEffectTarget(),duration,{
                  "x":pos.x,
                  "y":pos.y,
                  "onUpdate":gem.onMoving
               });
            }
            i++;
         }
      }
      
      public function playDisappear(param1:Vector.<GemBase>, param2:Function) : void
      {
         var gem:GemBase = null;
         var num:int = 0;
         var i:int = 0;
         var j:int = 0;
         var myTween:TweenLite = null;
         var target:Object = null;
         var playDisappearCompletedHandler:Function = null;
         var result:Vector.<GemBase> = param1;
         var playCompletedHandler:Function = param2;
         playDisappearCompletedHandler = function():void
         {
            j = 0;
            while(j < num)
            {
               gem = result[j] as GemBase;
               (gem as JewelBase).isMove = false;
               ++j;
            }
            playCompletedHandler.call();
         };
         SoundCmd.playSound(349);
         num = result.length;
         j = 0;
         while(j < num)
         {
            gem = result[j] as GemBase;
            (gem as JewelBase).isMove = true;
            (gem as JewelBase).playDisppearEff();
            target = gem.getEffectTarget();
            if(!target)
            {
               getLogger("TD").error("jewels : playDisappear - target为null");
            }
            if(j == num - 1)
            {
               if(target)
               {
                  TweenLite.to(gem.getEffectTarget(),0.3,{
                     "alpha":0,
                     "onComplete":playDisappearCompletedHandler
                  });
               }
               else
               {
                  TweenLite.delayedCall(0.3,playDisappearCompletedHandler);
               }
            }
            else if(target)
            {
               TweenLite.to(gem.getEffectTarget(),0.3,{"alpha":0});
            }
            j++;
         }
      }
      
      private function getTargetPoint(param1:GemBase) : Point
      {
         var _loc2_:TDMapTileData = TDMiniGameJewelsData.instance.getMapData(param1.idx,param1.idy);
         return TDGameInfo.getInstance().getPlantPos(_loc2_.index,param1.type);
      }
      
      private function sortGem(param1:GemBase, param2:GemBase) : Number
      {
         if(param1.idy > param2.idy)
         {
            return -1;
         }
         if(param1.idy < param2.idy)
         {
            return 1;
         }
         return 0;
      }
   }
}
