package com.qq.modules.td.model
{
   import com.qq.constant.td.TDShootingGameConstant;
   
   public class TDMiniGameShootingData
   {
      
      private static var _instance:TDMiniGameShootingData;
       
      
      private var _windForce:int;
      
      public function TDMiniGameShootingData()
      {
         super();
      }
      
      public static function getInstance() : TDMiniGameShootingData
      {
         if(_instance == null)
         {
            _instance = new TDMiniGameShootingData();
         }
         return _instance;
      }
      
      public function get windForce() : int
      {
         return this._windForce;
      }
      
      public function changeWind() : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc1_:Array = TDShootingGameConstant.WIND_RANDOM_WEIGHT;
         for each(_loc3_ in _loc1_)
         {
            _loc2_ += _loc3_;
         }
         _loc4_ = int(Math.random() * _loc2_);
         _loc7_ = 0;
         while(_loc7_ < _loc1_.length)
         {
            _loc5_ += _loc1_[_loc7_];
            if(_loc4_ < _loc5_)
            {
               _loc6_ = _loc7_;
               break;
            }
            _loc7_++;
         }
         this._windForce = TDShootingGameConstant.MIN_WIND_FORCE + _loc6_;
         return this.windForce;
      }
      
      public function reset() : void
      {
         this._windForce = 0;
      }
   }
}
