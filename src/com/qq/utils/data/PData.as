package com.qq.utils.data
{
   import com.qq.modules.td.command.game.TDGameCmd;
   import flash.utils.setTimeout;
   
   public class PData
   {
       
      
      private var _isInited:Boolean;
      
      private var _keyID:int;
      
      protected var temp1:int;
      
      protected var temp2:int;
      
      protected var num1:int;
      
      protected var num2:int;
      
      private var _isDoubleCheck:Boolean;
      
      private var _checkSumData:CheckSumData;
      
      public function PData(param1:Boolean = false)
      {
         super();
         this.num1 = 0;
         this.num2 = 0;
         this._keyID = PDataKeyManager.getInstance().getLastestKeyID();
         this._isDoubleCheck = param1;
         this._checkSumData = new CheckSumData();
         this._isInited = false;
      }
      
      public function set(param1:Number) : void
      {
         this.checkKey();
         if(this._isDoubleCheck)
         {
            this._checkSumData.putData(param1);
         }
         this.temp1 = int(param1);
         this.num1 = PDataKeyManager.getInstance().encrypt(this._keyID,this.temp1);
         param1 -= this.temp1;
         this.temp2 = int(param1 * 10000);
         this.num2 = PDataKeyManager.getInstance().encrypt(this._keyID,this.temp2);
         this._isInited = true;
      }
      
      public function get() : Number
      {
         var _loc2_:Number = NaN;
         this.checkKey();
         this.temp1 = PDataKeyManager.getInstance().encrypt(this._keyID,this.num1);
         this.temp2 = PDataKeyManager.getInstance().encrypt(this._keyID,this.num2);
         var _loc1_:Number = this.temp1 + this.temp2 * 0.0001;
         if(this._isDoubleCheck)
         {
            _loc2_ = this._checkSumData.getTotal();
            if(_loc2_ != _loc1_)
            {
               setTimeout(TDGameCmd.reportCheatGame,100);
            }
         }
         return _loc1_;
      }
      
      private function checkKey() : void
      {
         var _loc1_:Number = NaN;
         if(!this._isInited)
         {
            return;
         }
         if(this._keyID != PDataKeyManager.getInstance().getLastestKeyID())
         {
            this.temp1 = PDataKeyManager.getInstance().encrypt(this._keyID,this.num1);
            this.temp2 = PDataKeyManager.getInstance().encrypt(this._keyID,this.num2);
            _loc1_ = this.temp1 + this.temp2 * 0.0001;
            this._keyID = PDataKeyManager.getInstance().getLastestKeyID();
            this.set(_loc1_);
         }
      }
   }
}
