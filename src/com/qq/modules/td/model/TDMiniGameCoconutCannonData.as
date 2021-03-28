package com.qq.modules.td.model
{
   import com.qq.utils.data.PData;
   
   public class TDMiniGameCoconutCannonData
   {
      
      private static var _instance:TDMiniGameCoconutCannonData;
       
      
      public var lastResult:int;
      
      private var _combatNum:PData;
      
      private var _totalScore:PData;
      
      public function TDMiniGameCoconutCannonData()
      {
         super();
         this._combatNum = new PData();
         this._totalScore = new PData();
      }
      
      public static function getInstance() : TDMiniGameCoconutCannonData
      {
         if(_instance == null)
         {
            _instance = new TDMiniGameCoconutCannonData();
         }
         return _instance;
      }
      
      public function reset() : void
      {
         this._combatNum.set(0);
         this._totalScore.set(0);
      }
      
      public function dispose() : void
      {
      }
      
      public function addAttack(param1:int) : int
      {
         var _loc2_:int = this.getUnitScore(param1) * param1;
         this.totalScore += _loc2_;
         return _loc2_;
      }
      
      private function getUnitScore(param1:int) : int
      {
         if(param1 >= 12)
         {
            return 500;
         }
         if(param1 >= 8)
         {
            return 400;
         }
         if(param1 >= 5)
         {
            return 300;
         }
         if(param1 >= 3)
         {
            return 200;
         }
         return 100;
      }
      
      public function get combatNum() : int
      {
         return this._combatNum.get();
      }
      
      public function set combatNum(param1:int) : void
      {
         this._combatNum.set(param1);
      }
      
      public function get totalScore() : int
      {
         return this._totalScore.get();
      }
      
      public function set totalScore(param1:int) : void
      {
         this._totalScore.set(param1);
      }
   }
}
