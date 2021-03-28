package com.qq.modules.td.logic.unit.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.model.TDMiniGameTerracottaMemoryData;
   
   public class TerracottaZombie extends BasicZombie
   {
       
      
      private var _isCanWake:Boolean;
      
      private var _isWake:Boolean;
      
      private var _finalRow:int;
      
      private var _finalCol:int;
      
      public function TerracottaZombie()
      {
         super();
      }
      
      public function get isCanWake() : Boolean
      {
         return this._isCanWake;
      }
      
      public function set isWake(param1:Boolean) : void
      {
         this._isWake = param1;
      }
      
      public function get isWake() : Boolean
      {
         return this._isWake;
      }
      
      override public function revive(param1:Array = null) : void
      {
         super.revive(param1);
         this._isCanWake = TDMiniGameTerracottaMemoryData.getInstance().addZombie(this);
         this.objectModel.addBuff(TDConstant.TDBuffID_God,null);
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
