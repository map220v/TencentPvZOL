package com.qq.modules.battle.model
{
   import PVZ.Cmd.Dto_FightReport;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.planMachine.core.PlanClockCenter;
   import com.qq.modules.battle.view.unit.UnitBase;
   import com.qq.modules.battle.view.unit.UnitFactory;
   import flash.utils.Dictionary;
   
   public class BattleUnitModel
   {
      
      private static var _instance:BattleUnitModel;
       
      
      public var dummyList:Vector.<UnitBase>;
      
      public var dummyPosMap:Array;
      
      public var leftDummyBottom:UnitBase;
      
      public var rightDummyBottom:UnitBase;
      
      public var unitList:Vector.<UnitBase>;
      
      public var unitPosDic:Dictionary;
      
      public var attackUnit_col1:UnitBase;
      
      public var attackUnit_col2:UnitBase;
      
      public var attackUnit_col3:UnitBase;
      
      public var maxUnitNum:int = 21.0;
      
      public var cacheAttackUnit:UnitBase;
      
      public var cacheDepth:int = -1;
      
      public var maxDummyNum:int = 10;
      
      public var report:Dto_FightReport;
      
      public var battleTimer:PlanClockCenter;
      
      public function BattleUnitModel()
      {
         super();
      }
      
      public static function getInstance() : BattleUnitModel
      {
         if(_instance == null)
         {
            _instance = new BattleUnitModel();
         }
         return _instance;
      }
      
      public function reset() : void
      {
         var _loc1_:int = 0;
         var _loc3_:UnitBase = null;
         var _loc4_:UnitBase = null;
         var _loc5_:UnitBase = null;
         this.unitList = new Vector.<UnitBase>();
         this.unitPosDic = new Dictionary();
         this.dummyList = new Vector.<UnitBase>();
         this.dummyPosMap = new Array();
         _loc1_ = 0;
         while(_loc1_ < this.maxUnitNum)
         {
            _loc3_ = UnitFactory.instance.createUnit();
            this.unitList.push(_loc3_);
            _loc3_.setAlpha(0.6);
            if(_loc1_ == 6)
            {
               BattleUnitModel.getInstance().attackUnit_col1 = _loc3_;
            }
            else if(_loc1_ == 13)
            {
               BattleUnitModel.getInstance().attackUnit_col2 = _loc3_;
            }
            else if(_loc1_ == 20)
            {
               BattleUnitModel.getInstance().attackUnit_col3 = _loc3_;
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.maxDummyNum)
         {
            _loc4_ = UnitFactory.instance.createUnit();
            this.dummyList.push(_loc4_);
            this.dummyPosMap[101 + _loc1_] = _loc4_;
            _loc1_++;
         }
         this.leftDummyBottom = new UnitBase();
         this.rightDummyBottom = new UnitBase();
         var _loc2_:int = BattleConst.unitDepthMaping.length;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            _loc5_ = BattleUnitModel.getInstance().unitList[BattleConst.unitDepthMaping[_loc1_]];
            BattleUnitModel.getInstance().unitPosDic[_loc1_ + 1] = _loc5_;
            _loc1_++;
         }
      }
      
      public function swapUnit(param1:UnitBase, param2:int = 0) : void
      {
         var _loc3_:int = 0;
         if(param2 == 0)
         {
            if(this.cacheAttackUnit)
            {
               _loc3_ = this.cacheAttackUnit.display.parent.getChildIndex(this.cacheAttackUnit.display);
               if(_loc3_ != this.cacheDepth)
               {
                  this.cacheAttackUnit.display.parent.swapChildrenAt(_loc3_,this.cacheDepth);
               }
            }
            this.cacheAttackUnit = null;
            this.cacheDepth = -1;
         }
         else
         {
            if(this.cacheAttackUnit)
            {
               this.swapUnit(param1);
            }
            this.cacheAttackUnit = this["attackUnit_col" + param2];
            this.cacheDepth = this.cacheAttackUnit.display.parent.getChildIndex(this.cacheAttackUnit.display);
            param1.display.parent.swapChildren(param1.display,this.cacheAttackUnit.display);
         }
      }
      
      public function closeBattle() : void
      {
         var _loc2_:UnitBase = null;
         var _loc3_:UnitBase = null;
         if(this.battleTimer)
         {
            this.battleTimer.stop();
         }
         this.cacheAttackUnit = null;
         this.unitPosDic = null;
         this.attackUnit_col1.dispose();
         this.attackUnit_col1 = null;
         this.attackUnit_col2.dispose();
         this.attackUnit_col2 = null;
         this.attackUnit_col3.dispose();
         this.attackUnit_col3 = null;
         if(this.leftDummyBottom != null)
         {
            this.leftDummyBottom.dispose();
         }
         this.leftDummyBottom = null;
         if(this.rightDummyBottom != null)
         {
            this.rightDummyBottom.dispose();
         }
         this.rightDummyBottom = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.unitList.length)
         {
            _loc2_ = this.unitList[_loc1_] as UnitBase;
            _loc2_.dispose();
            _loc1_++;
         }
         this.unitList = null;
         this.dummyPosMap = null;
         while(this.dummyList.length)
         {
            _loc3_ = this.dummyList.pop();
            _loc3_.dispose();
         }
         this.dummyList = null;
         if(this.battleTimer)
         {
            this.battleTimer.dispose();
            this.battleTimer = null;
         }
      }
      
      public function getUnitByPosIndex(param1:int) : UnitBase
      {
         if(param1 < 100)
         {
            return this.unitPosDic[param1];
         }
         return this.dummyPosMap[param1];
      }
      
      public function getUnitIndex(param1:UnitBase) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.unitList.length)
         {
            if(this.unitList[_loc2_] == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return 0;
      }
   }
}
