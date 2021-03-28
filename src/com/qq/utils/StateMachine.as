package com.qq.utils
{
   import org.as3commons.logging.api.getLogger;
   
   public class StateMachine
   {
       
      
      private var _stateList:Array;
      
      private var _curState:String;
      
      public function StateMachine()
      {
         super();
         this._stateList = new Array();
      }
      
      public function get stateList() : Array
      {
         return this._stateList;
      }
      
      public function addState(param1:String, param2:Function, param3:Function = null, param4:Function = null, param5:Function = null, param6:Boolean = true, param7:Function = null) : void
      {
         this._stateList[param1] = [param2,param3,param4,param5,param6,param7];
      }
      
      public function hasState(param1:String) : Boolean
      {
         return this._stateList[param1] != null;
      }
      
      public function getCurState() : String
      {
         return this._curState;
      }
      
      public function setState(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:Boolean = false;
         if(this._curState != null && this._stateList[this._curState] != null)
         {
            if(!(_loc4_ = this._stateList[this._curState][4]) && !param3)
            {
               return;
            }
            this.doLeaveStateFunc();
         }
         this._curState = param1;
         this.doEnterStateFunc(param2);
      }
      
      public function doEnterStateFunc(param1:Array) : void
      {
         var _loc2_:Function = null;
         var _loc3_:Function = null;
         if(this._stateList[this._curState] != null)
         {
            _loc2_ = this._stateList[this._curState][0];
            if(_loc2_ != null)
            {
               _loc2_(param1);
            }
            _loc3_ = this._stateList[this._curState][5];
            if(_loc3_ != null)
            {
               _loc3_();
            }
         }
         else
         {
            getLogger("td").info("stateMachine:没有该动作" + this._curState);
         }
      }
      
      public function doRunningFunc() : void
      {
         var _loc1_:Function = null;
         if(this._stateList[this._curState] != null)
         {
            _loc1_ = this._stateList[this._curState][1];
            if(_loc1_ != null)
            {
               _loc1_();
            }
         }
      }
      
      public function doLeaveStateFunc() : void
      {
         var _loc1_:Function = null;
         if(this._stateList[this._curState] != null)
         {
            _loc1_ = this._stateList[this._curState][2];
            if(_loc1_ != null)
            {
               _loc1_();
            }
         }
      }
      
      public function clean() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Function = null;
         this.doLeaveStateFunc();
         for each(_loc1_ in this._stateList)
         {
            _loc2_ = _loc1_[3];
            if(_loc2_ != null)
            {
               _loc2_();
            }
         }
         _loc1_ = null;
      }
   }
}
