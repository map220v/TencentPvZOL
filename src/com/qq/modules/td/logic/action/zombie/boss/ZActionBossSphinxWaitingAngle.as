package com.qq.modules.td.logic.action.zombie.boss
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.DMath;
   import org.as3commons.logging.api.getLogger;
   
   public class ZActionBossSphinxWaitingAngle extends BasicAction
   {
       
      
      private var _lastTime:Number;
      
      private var _angleDuration:int;
      
      private var _angleMoveRowMin:int;
      
      private var _angleMoveRowMax:int;
      
      private var _angryMoveRow:int;
      
      public function ZActionBossSphinxWaitingAngle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         getLogger("boss").info("boss waiting angle");
         super.enterState(param1);
         var _loc2_:XML = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_InitParamXml);
         if(_loc2_ != null)
         {
            this._angleDuration = int(_loc2_.angryDuration.@value);
            this._angleMoveRowMin = int(_loc2_.angryMoveRange.@rowMin);
            this._angleMoveRowMax = int(_loc2_.angryMoveRange.@rowMax);
            if(int(_loc2_.angryMoveRow.@value) == 0)
            {
               this._angryMoveRow = 3;
            }
            else
            {
               this._angryMoveRow = int(_loc2_.angryMoveRow.@value);
            }
         }
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
         _gameObject.animation.gotoAndPlay("stand",true);
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
      
      override public function runningState() : void
      {
         var _loc2_:int = 0;
         super.runningState();
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(_loc1_ - this._lastTime > this._angleDuration)
         {
            _loc2_ = this.getNextMoveRoadIndex();
            _gameObject.setAction(TDConstant.ZAction_BossSphinx_AngleMove,[_loc2_]);
         }
      }
      
      private function getNextMoveRoadIndex() : int
      {
         var _loc1_:int = 1;
         var _loc2_:Array = new Array();
         var _loc3_:int = this._angleMoveRowMin;
         while(_loc3_ <= this._angleMoveRowMax)
         {
            if(Math.abs(_gameObject.objectModel.roadIndex - _loc3_) <= this._angryMoveRow)
            {
               if(_gameObject.objectModel.roadIndex != _loc3_)
               {
                  _loc2_.push(_loc3_);
               }
            }
            _loc3_++;
         }
         if(_loc2_.length > 0)
         {
            _loc1_ = _loc2_[DMath.randNum(0,_loc2_.length - 1)];
         }
         return _loc1_;
      }
   }
}
