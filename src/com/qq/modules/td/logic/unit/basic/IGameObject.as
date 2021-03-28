package com.qq.modules.td.logic.unit.basic
{
   import asgui.core.IDisposable;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public interface IGameObject extends IDisposable
   {
       
      
      function get uid() : uint;
      
      function set scaleX(param1:Number) : void;
      
      function get scaleX() : Number;
      
      function set scaleY(param1:Number) : void;
      
      function get scaleY() : Number;
      
      function set alpha(param1:Number) : void;
      
      function get alpha() : Number;
      
      function get animation() : GameObjectAnimation;
      
      function get damageArea() : Rectangle;
      
      function get attackArea() : Rectangle;
      
      function set damageArea(param1:Rectangle) : void;
      
      function set attackArea(param1:Rectangle) : void;
      
      function get explodeEffectArea() : Rectangle;
      
      function get frontLayer() : Object;
      
      function get timeScale() : Number;
      
      function get curAttackTarget() : IGameObject;
      
      function get isVaild() : Boolean;
      
      function set isVaild(param1:Boolean) : void;
      
      function get x() : Number;
      
      function set x(param1:Number) : void;
      
      function get y() : Number;
      
      function set y(param1:Number) : void;
      
      function get objectModel() : TDGameObjectData;
      
      function get isUpdate() : Boolean;
      
      function set isUpdate(param1:Boolean) : void;
      
      function get rotation() : Number;
      
      function set rotation(param1:Number) : void;
      
      function setFrozenAI(param1:Boolean) : void;
      
      function isFrozenAI() : Boolean;
      
      function addMouseEventListener(param1:String, param2:Function) : void;
      
      function removeMouseEventListener(param1:String, param2:Function) : void;
      
      function changeHp(param1:int, param2:int, param3:int, param4:IGameObject) : Boolean;
      
      function start() : void;
      
      function update() : void;
      
      function setData(param1:TDGameObjectData) : void;
      
      function setAction(param1:String = null, param2:Array = null, param3:Boolean = false) : void;
      
      function getActionID() : String;
      
      function getAllActionIDList() : Array;
      
      function setLocation(param1:Number, param2:Number) : void;
      
      function setTimeScale(param1:Number) : void;
      
      function updateTimeScale() : void;
      
      function get needShade() : Boolean;
      
      function get needSplash() : Boolean;
      
      function addShade() : void;
      
      function setShadeVisible(param1:Boolean) : void;
      
      function setButtonMode(param1:Boolean) : void;
      
      function dispose(param1:Boolean = true) : void;
      
      function getCurSpeed() : Number;
      
      function removeSelf() : void;
      
      function hasFilter(param1:int) : Boolean;
      
      function addFilter(param1:int, param2:Object, param3:int = 0) : Boolean;
      
      function removeFilter(param1:int) : void;
      
      function removeAllFilter() : void;
      
      function setTimeRecord(param1:int, param2:Number) : void;
      
      function getTimeRecord(param1:int) : Number;
      
      function setAttackTarget(param1:IGameObject) : void;
      
      function setAICustomProp(param1:String, param2:Boolean) : void;
      
      function checkAICustomProp(param1:String, param2:Boolean) : Boolean;
      
      function hasAICustomProp(param1:String) : Boolean;
      
      function getFireBonePos(param1:String) : Point;
      
      function setMouseEnable(param1:Boolean) : void;
      
      function set scrollRect(param1:Rectangle) : void;
      
      function get scrollRect() : Rectangle;
      
      function get contentW() : int;
      
      function get contentH() : int;
      
      function setRunningProp(param1:int, param2:*) : void;
      
      function getRunningProp(param1:int) : *;
      
      function setRunningPropList(param1:Array) : void;
      
      function cleanRunningProp(param1:int) : void;
      
      function hasRunningProp(param1:int) : Boolean;
      
      function debug_showAreaInfo() : void;
      
      function debug_hideAreaInfo() : void;
   }
}
