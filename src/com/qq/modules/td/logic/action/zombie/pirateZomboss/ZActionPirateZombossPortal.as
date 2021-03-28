package com.qq.modules.td.logic.action.zombie.pirateZomboss
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.PvzMathUtil;
   import flash.events.Event;
   import net.sakri.flash.math.MathUtil;
   import tencent.base.utils.ArrayUtil;
   
   public class ZActionPirateZombossPortal extends BasicZombieAction
   {
       
      
      private var _isPortaling:Boolean;
      
      private var _lastPortalTime:int;
      
      private var _summonZombieTypeList:XMLList;
      
      private var _curPortalIndex:int;
      
      private var _curPortalZombieType:Array;
      
      private var _curPortalNum:int;
      
      private var _curPortalInterval:int;
      
      private var _curBeanArr:Array;
      
      private var _curRatioArr:Array;
      
      public function ZActionPirateZombossPortal()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         var _loc2_:XML = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_InitParamXml);
         if(_loc2_ != null)
         {
            this._summonZombieTypeList = _loc2_.portalZombie.list;
         }
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishPortalStart);
         _gameObject.animation.gotoAndPlay("zombie_portal_start");
         this._isPortaling = false;
      }
      
      private function onFinishPortalStart(param1:Event) : void
      {
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishPortalStart);
         var _loc2_:XML = this._summonZombieTypeList[this._curPortalIndex];
         this._curPortalZombieType = String(_loc2_.@type).split(",");
         this._curPortalNum = int(_loc2_.@num);
         this._curPortalInterval = int(_loc2_.@interval);
         var _loc3_:Array = String(_loc2_.@bean).split(",");
         var _loc4_:int = PvzMathUtil.randomByChance(_loc3_);
         this._curBeanArr = PvzMathUtil.randomBoolenArr(this._curPortalNum,_loc4_);
         this._curRatioArr = [];
         if(_loc2_.@ratio != null)
         {
            _loc5_ = ArrayUtil.convertToInt(String(_loc2_.@ratio).split(","));
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc5_[_loc6_])
               {
                  this._curRatioArr.push(parseInt(this._curPortalZombieType[_loc6_]));
                  _loc7_++;
               }
               _loc6_++;
            }
         }
         if(this._curPortalIndex < this._summonZombieTypeList.length() - 1)
         {
            ++this._curPortalIndex;
         }
         this._isPortaling = true;
         this._lastPortalTime = TDGameInfo.getInstance().getCurGameTime();
         _gameObject.animation.gotoAndPlay("zombie_portal_loop",true);
      }
      
      override public function runningState() : void
      {
         var _loc1_:TDMapTileData = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         super.runningState();
         if(this._isPortaling)
         {
            if(this._curPortalZombieType.length > 0 && this._curPortalNum > 0)
            {
               if(this._lastPortalTime + this._curPortalInterval < TDGameInfo.getInstance().getCurGameTime())
               {
                  this._lastPortalTime = TDGameInfo.getInstance().getCurGameTime();
                  _loc1_ = TDGameInfo.getInstance().getRoadTileByGamePos(_zombie.x,_zombie.y);
                  if(this._curRatioArr.length == 0 || this.sumArr(this._curRatioArr) == 0)
                  {
                     _loc2_ = this._curPortalZombieType[MathUtil.getRandomIntInRange(0,this._curPortalZombieType.length - 1)];
                  }
                  else
                  {
                     this._curRatioArr = ArrayUtil.shuffle(this._curRatioArr);
                     _loc2_ = this._curRatioArr.shift();
                  }
                  _loc3_ = Math.random() < 0.5 ? int(_loc1_.roadRow) : int(_loc1_.roadRow + 1);
                  _loc4_ = _loc1_.roadCol + 2;
                  TDGameObjectCmd.portalZombie(_loc2_,_loc4_,_loc3_,this._curBeanArr[this._curBeanArr.length - this._curPortalNum]);
                  --this._curPortalNum;
               }
            }
            else
            {
               this._isPortaling = false;
               _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishPortal);
               _gameObject.animation.gotoAndPlay("zombie_portal_end");
            }
         }
      }
      
      private function sumArr(param1:Array) : Number
      {
         if(param1 == null || param1.length == 0)
         {
            return 0;
         }
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ += Number(param1[_loc3_]);
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function onFinishPortal(param1:Event) : void
      {
         _gameObject.setFrozenAI(false);
         _gameObject.setAction();
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishPortalStart);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishPortal);
         super.leaveState();
      }
   }
}
