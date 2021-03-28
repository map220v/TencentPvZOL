package com.qq.modules.battle.view.control
{
   import com.qq.display.QCanvas;
   import com.qq.modules.battle.view.unit.UnitBase;
   
   public class BaseUnitControler
   {
      
      public static const TYPE_PROGRESS:String = "TYPE_PROGRESS";
      
      public static const TYPE_BLOOD:String = "TYPE_BLOOD";
      
      public static const TYPE_RAGE:String = "TYPE_RAGE";
      
      public static const TYPE_BUFF:String = "TYPE_BUFF";
      
      public static const TYPE_SHIED:String = "TYPE_SHIED";
      
      public static const TYPE_AWAKE:String = "TYPE_AWAKE";
      
      public static const TYPE_DNA:String = "TYPE_DNA";
      
      public static const TYPE_PLANTARMOR:String = "TYPE_PLANTARMOR";
       
      
      protected var _unit:UnitBase;
      
      protected var _unitLayer:QCanvas;
      
      protected var _animaLayer:QCanvas;
      
      public var isRight:Boolean;
      
      public function BaseUnitControler()
      {
         super();
      }
      
      public function dispose() : void
      {
         this._unit = null;
         this._unitLayer = null;
         this._animaLayer = null;
      }
      
      public function setData(param1:UnitBase, param2:QCanvas, param3:QCanvas) : void
      {
         this._unit = param1;
         this._unitLayer = param2;
         this._animaLayer = param3;
         this.initlize();
      }
      
      protected function initlize() : void
      {
      }
      
      public function get ctrType() : String
      {
         throw Error("need override this function! --- UnitControler");
      }
      
      public function clear() : void
      {
      }
   }
}
