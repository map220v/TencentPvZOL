package com.qq.modules.td.logic.miniGame.jewels
{
   import com.gems.GemBase;
   import com.gems.GemNode;
   import com.gems.vo.GemThawGroupVo;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.logic.action.plant.sunflower.PlanProductItem;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDMiniGameJewelsData;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class TDMiniGameJewelsMouseCtr
   {
       
      
      private var _isStart:Boolean = false;
      
      private var _isMoving:Boolean = false;
      
      private var cacheJewelA:GemBase;
      
      private var cacheJewelB:GemBase;
      
      public var cacheResult:GemThawGroupVo;
      
      public var autoCheckGemVec:Vector.<GemBase>;
      
      private var controler:TDMiniGameJewelsControler;
      
      private var mouseOverTarget:JewelBase;
      
      private var timer:Timer;
      
      public function TDMiniGameJewelsMouseCtr(param1:TDMiniGameJewelsControler)
      {
         super();
         this.controler = param1;
         this.timer = new Timer(500);
         this.timer.addEventListener(TimerEvent.TIMER,this.mouseMoveHandler);
      }
      
      public function reset() : void
      {
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         GameGloble.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
         GameGloble.stage.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         this.timer.reset();
         this.timer.start();
      }
      
      public function start() : void
      {
         this._isStart = true;
      }
      
      protected function mouseMoveHandler(param1:Event) : void
      {
         if(!this._isStart)
         {
            return;
         }
         if(this._isMoving)
         {
            return;
         }
         var _loc2_:JewelBase = this.getJewel();
         if(_loc2_)
         {
            if(this.mouseOverTarget && this.mouseOverTarget.idx == _loc2_.idx && this.mouseOverTarget.idy == _loc2_.idy)
            {
               return;
            }
            if(this.mouseOverTarget && (this.mouseOverTarget.idx != _loc2_.idx || this.mouseOverTarget.idy != _loc2_.idy))
            {
               this.mouseOverTarget.setMouseOver(false);
            }
            this.mouseOverTarget = _loc2_;
            this.mouseOverTarget.setMouseOver(true);
         }
         else if(this.mouseOverTarget)
         {
            this.mouseOverTarget.setMouseOver(false);
         }
      }
      
      protected function mouseUpHandler(param1:MouseEvent) : void
      {
         if(!this._isStart)
         {
            return;
         }
         if(this._isMoving)
         {
            return;
         }
         if(this.cacheJewelA == null)
         {
            return;
         }
         this.cacheJewelB = this.getJewel();
         if(this.cacheJewelB == null)
         {
            return;
         }
         if(this.cacheJewelA.idx == this.cacheJewelB.idx && this.cacheJewelA.idy == this.cacheJewelB.idy)
         {
            return;
         }
         if(!this.cacheJewelA.isNear(this.cacheJewelB))
         {
            return;
         }
         if(this.cacheJewelA.empty == true || this.cacheJewelB.empty == true)
         {
            return;
         }
         this._isMoving = true;
         this.cacheResult = this.controler.gemWar.gemExchange(this.cacheJewelA,this.cacheJewelB,new JewelsEffector(),this.exchangeCallBack);
         if(this.cacheResult.length <= 0)
         {
            CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_MGAME_JEWELS_MISSTAKE_NUM,[]));
         }
      }
      
      public function exchangeCallBack() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Vector.<GemBase> = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:GemNode = null;
         if(this.cacheResult && this.cacheResult.length > 0)
         {
            _loc1_ = this.cacheResult.lineLength;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this.dropSun(this.cacheResult.gemThawLineVec[_loc2_].middleGem().getEffectTarget() as IGameObject,this.cacheResult.gemThawLineVec[_loc2_].gemThawVec.length);
               _loc2_++;
            }
            CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_MGAME_JEWELS_EXCHANGE_NUM,[this.cacheResult.lineLength]));
            TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Plant_Crash_Count,this.cacheResult.lineLength);
            if(this.cacheResult.lineLength > 1)
            {
               TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Plant_Crash_Combo_Count,this.cacheResult.lineLength - 1);
            }
            _loc3_ = this.controler.gemWar.getAddGemByRemoveGem(this.cacheResult.gemThawAllVec);
            this.autoCheckGemVec = this.controler.gemWar.exchangeAdd(this.cacheResult.gemThawAllVec,_loc3_,new JewelsEffector(),this.addedCallBack);
         }
         else
         {
            this._isMoving = false;
            this.cacheJewelA = null;
            this.cacheJewelB = null;
            _loc4_ = 0;
            while(_loc4_ < this.controler.gemWar.col)
            {
               _loc5_ = 0;
               while(_loc5_ < this.controler.gemWar.row)
               {
                  if((_loc6_ = this.controler.gemWar.getGemNodeAt(_loc4_,_loc5_)).gem != null)
                  {
                     if(!_loc6_.gem.empty && _loc6_.gem.getEffectTarget() == null)
                     {
                     }
                  }
                  _loc5_++;
               }
               _loc4_++;
            }
         }
         this.cacheResult = null;
      }
      
      private function dropSun(param1:IGameObject, param2:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = TDConstant.UnitType_PlantSun;
         if(param2 == 3)
         {
            _loc4_ = 1;
         }
         else if(param2 == 4)
         {
            _loc4_ = 2;
         }
         else
         {
            _loc4_ = 3;
         }
         var _loc5_:int = int(20 * Math.random());
         var _loc6_:int = 0;
         var _loc7_:PlanProductItem;
         (_loc7_ = new PlanProductItem(param1,_loc3_,_loc4_,_loc5_,_loc6_)).doPlan(null);
      }
      
      public function addedCallBack() : void
      {
         this.cacheResult = this.controler.gemWar.checkAutoDisappear(this.autoCheckGemVec,new JewelsEffector(),this.exchangeCallBack);
      }
      
      protected function mouseDownHandler(param1:MouseEvent) : void
      {
         if(!this._isStart)
         {
            return;
         }
         if(this._isMoving)
         {
            return;
         }
         if(TDGameInfo.getInstance().isPause)
         {
            return;
         }
         this.cacheJewelA = this.getJewel();
      }
      
      private function getJewel() : JewelBase
      {
         var _loc1_:Point = new Point();
         _loc1_.x = GameGloble.stage.mouseX;
         _loc1_.y = GameGloble.stage.mouseY;
         _loc1_ = TDUILayerManager.effectLayer.globalToLocal(_loc1_);
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByScreenPos(_loc1_.x,_loc1_.y);
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:Point = TDMiniGameJewelsData.instance.getIdxyData(_loc2_);
         var _loc4_:GemNode;
         if(!(_loc4_ = this.controler.gemWar.getGemNodeAt(_loc3_.x,_loc3_.y)))
         {
            return null;
         }
         var _loc5_:GemBase;
         if(!(_loc5_ = _loc4_.gem))
         {
            return null;
         }
         return _loc5_ as JewelBase;
      }
      
      public function dispose() : void
      {
         this._isStart = false;
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         this.timer.removeEventListener(TimerEvent.TIMER,this.mouseMoveHandler);
         this.timer = null;
      }
   }
}
