package com.qq.modules.td.model
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.tips.ShowTipCmd;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.zombie.TerracottaZombie;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.PvzMathUtil;
   import com.qq.utils.tqos.TQOSUtils;
   import flash.geom.Point;
   
   public class TDMiniGameTerracottaMemoryData
   {
      
      private static var _instance:TDMiniGameTerracottaMemoryData;
       
      
      private var _isWake:Boolean;
      
      private var _rotatePara:Array;
      
      private var _knockTime:int;
      
      private var _watchTime:int;
      
      private var _waveTotalZombieCount:int;
      
      private var _waveTotalWakeCount:int;
      
      private var _waveShockChance:int;
      
      private var _currentZomibeIndex:int;
      
      private var _currentReadyCount:int;
      
      private var _currentEndCount:int;
      
      private var _wakeRandomArr:Array;
      
      private var _minX:int;
      
      private var _maxX:int;
      
      private var _minY:int;
      
      private var _maxY:int;
      
      private var _minRow:int;
      
      private var _maxRow:int;
      
      private var _minCol:int;
      
      private var _maxCol:int;
      
      private const TOTAL_ROTATE_DEGREE:Number = 0.5;
      
      private const STEP_COUNT:int = 20;
      
      public function TDMiniGameTerracottaMemoryData()
      {
         super();
      }
      
      public static function getInstance() : TDMiniGameTerracottaMemoryData
      {
         if(_instance == null)
         {
            _instance = new TDMiniGameTerracottaMemoryData();
         }
         return _instance;
      }
      
      public function reset() : void
      {
      }
      
      public function get isWake() : Boolean
      {
         return this._isWake;
      }
      
      public function smash(param1:TerracottaZombie) : void
      {
         --this._waveShockChance;
         TDDamageCaculete.executeDamage(param1,-param1.objectModel.maxHp.get(),TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,param1);
         CommandDispatcher.send(CommandName.TDMiniGame_TerracottaMemory_Smash);
         if(this._waveShockChance <= 0)
         {
            this._isWake = true;
            CommandDispatcher.send(CommandName.TD_TextTip_Hide);
         }
         if(!param1.isCanWake)
         {
            TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Terracotta_Miss);
         }
      }
      
      public function wakeCotta(param1:TerracottaZombie) : void
      {
         if((param1 as TerracottaZombie).isCanWake)
         {
            param1.setAction(TDConstant.ZAction_Terracotta_Ctz);
         }
         else
         {
            TDDamageCaculete.executeDamage(param1,-param1.objectModel.maxHp.get(),TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,param1);
         }
      }
      
      public function endShow() : void
      {
         ++this._currentReadyCount;
      }
      
      public function endLineUp() : void
      {
         ++this._currentEndCount;
         if(this._currentEndCount == this._waveTotalZombieCount)
         {
            CommandDispatcher.send(CommandName.TD_ForceSortDepth);
            ShowTipCmd.showCountDown(this.knockTime);
         }
      }
      
      public function isAllShowReady() : Boolean
      {
         return this._currentReadyCount >= this._waveTotalZombieCount;
      }
      
      public function get knockTime() : int
      {
         return this._knockTime * 1000;
      }
      
      public function get watchTime() : int
      {
         return this._watchTime * 1000;
      }
      
      public function get waveShockChance() : int
      {
         return this._waveShockChance;
      }
      
      public function startNewWave(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:int) : void
      {
         this._rotatePara = !!param3 ? param3 : [1];
         this._knockTime = param4;
         this._waveTotalZombieCount = param1;
         this._waveTotalWakeCount = param2;
         this._waveShockChance = param5 < 0 ? int(param2) : int(param5);
         this._watchTime = param6;
         this._minX = int.MAX_VALUE;
         this._minY = int.MAX_VALUE;
         this._maxX = int.MIN_VALUE;
         this._maxY = int.MIN_VALUE;
         this._minCol = int.MAX_VALUE;
         this._minRow = int.MAX_VALUE;
         this._maxCol = int.MIN_VALUE;
         this._maxRow = int.MIN_VALUE;
         this._isWake = false;
         this._currentZomibeIndex = 0;
         this._currentReadyCount = 0;
         this._currentEndCount = 0;
         this._wakeRandomArr = PvzMathUtil.randomBoolenArr(this._waveTotalZombieCount,this._waveTotalWakeCount);
         CommandDispatcher.send(CommandName.TDMiniGame_TerracottaMemory_InitWave);
      }
      
      public function addZombie(param1:TerracottaZombie) : Boolean
      {
         if(param1.x > this._maxX)
         {
            this._maxX = param1.x;
         }
         if(param1.x < this._minX)
         {
            this._minX = param1.x;
         }
         if(param1.y > this._maxY)
         {
            this._maxY = param1.y;
         }
         if(param1.y < this._minY)
         {
            this._minY = param1.y;
         }
         if(param1.zombieData.startColumn > this._maxCol)
         {
            this._maxCol = param1.zombieData.startColumn;
         }
         if(param1.zombieData.startColumn < this._minCol)
         {
            this._minCol = param1.zombieData.startColumn;
         }
         if(param1.zombieData.roadIndex > this._maxRow)
         {
            this._maxRow = param1.zombieData.roadIndex;
         }
         if(param1.zombieData.roadIndex < this._minRow)
         {
            this._minRow = param1.zombieData.roadIndex;
         }
         var _loc2_:Boolean = this._wakeRandomArr[this._currentZomibeIndex];
         ++this._currentZomibeIndex;
         return _loc2_;
      }
      
      private function getRotateCenter() : Point
      {
         return new Point((this._minX + this._maxX) * 0.5,(this._minY + this._maxY) * 0.5);
      }
      
      private function get midRow() : Number
      {
         return (this._minRow + this._maxRow) * 0.5;
      }
      
      private function get midCol() : Number
      {
         return (this._minCol + this._maxCol) * 0.5;
      }
      
      public function getRotatePath(param1:TerracottaZombie) : Vector.<Point>
      {
         var _loc5_:Point = null;
         var _loc6_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:Point = null;
         var _loc10_:Array = null;
         var _loc11_:Point = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         if(this._currentZomibeIndex != this._waveTotalZombieCount)
         {
            TQOSUtils.getInstance().reportMsg("TerracottRotateError",true);
         }
         var _loc2_:Vector.<Point> = new Vector.<Point>();
         var _loc3_:Point = this.getRotateCenter();
         var _loc4_:Number = Math.sqrt((param1.x - _loc3_.x) * (param1.x - _loc3_.x) + (param1.y - _loc3_.y) * (param1.y - _loc3_.y));
         var _loc7_:Number = Math.atan2(param1.y - _loc3_.y,param1.x - _loc3_.x);
         for each(_loc8_ in this._rotatePara)
         {
            _loc14_ = this.STEP_COUNT * Math.abs(_loc8_);
            _loc15_ = 1;
            while(_loc15_ <= _loc14_)
            {
               _loc6_ = _loc7_ + Math.PI * this.TOTAL_ROTATE_DEGREE * _loc8_ * _loc15_ / _loc14_;
               (_loc5_ = new Point()).x = _loc3_.x + _loc4_ * Math.cos(_loc6_);
               _loc5_.y = _loc3_.y + _loc4_ * Math.sin(_loc6_);
               _loc2_.push(_loc5_);
               _loc15_++;
            }
            _loc7_ = _loc6_;
            _loc16_ = 0;
            while(_loc16_ < 20)
            {
               _loc2_.push(_loc5_);
               _loc16_++;
            }
         }
         _loc9_ = _loc2_[_loc2_.length - 1];
         _loc10_ = this.getFinalTile(param1.zombieData.startColumn,param1.zombieData.roadIndex);
         _loc11_ = TDGameInfo.getInstance().getZombieStartWalkPos(_loc10_[1],_loc10_[0]);
         _loc12_ = 5;
         _loc13_ = 1;
         while(_loc13_ <= _loc12_)
         {
            _loc2_.push(new Point(_loc9_.x + (_loc11_.x - _loc9_.x) * _loc13_ / _loc12_,_loc9_.y + (_loc11_.y - _loc9_.y) * _loc13_ / _loc12_));
            _loc13_++;
         }
         return _loc2_;
      }
      
      private function getFinalTile(param1:int, param2:int) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc3_:Number = Math.atan2(param2 - this.midRow,param1 - this.midCol);
         var _loc4_:Number = Math.sqrt((param1 - this.midCol) * (param1 - this.midCol) + (param2 - this.midRow) * (param2 - this.midRow));
         var _loc5_:int = 0;
         for each(_loc6_ in this._rotatePara)
         {
            _loc5_ += _loc6_;
         }
         _loc7_ = _loc3_ - Math.PI * this.TOTAL_ROTATE_DEGREE * _loc5_;
         _loc8_ = this.midCol + _loc4_ * Math.cos(_loc7_);
         _loc9_ = this.midRow + _loc4_ * Math.sin(_loc7_);
         return [Math.round(_loc8_),Math.round(_loc9_)];
      }
   }
}
