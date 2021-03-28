package com.qq.modules.td.logic.unit.bullet
{
   import com.qq.modules.td.data.game.unit.TDBulletData;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.unit.basic.GameObject;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.view.game.layer.shadow.TDShadowManager;
   import flash.geom.Point;
   
   public class BasicBullet extends GameObject
   {
       
      
      public var bulletData:TDBulletData;
      
      public var shooter:IGameObject;
      
      public var target:IGameObject;
      
      public var isSpecialSkill:Boolean;
      
      private var _targetPos:Point;
      
      private var _params:Array;
      
      protected var _pathFunc:Function;
      
      public var shootDir:int;
      
      public function BasicBullet()
      {
         super();
         this.isSpecialSkill = false;
      }
      
      public function get targetPos() : Point
      {
         return this._targetPos;
      }
      
      public function get params() : Array
      {
         return this._params;
      }
      
      override public function setData(param1:TDGameObjectData) : void
      {
         super.setData(param1);
         this.bulletData = param1 as TDBulletData;
      }
      
      override public function start() : void
      {
         if(!hasDisposed)
         {
            super.start();
            if(model.staticInfo.actionNameList.length > 0)
            {
               setAction(model.staticInfo.actionNameList[0]);
            }
         }
      }
      
      public function setFireInfo(param1:IGameObject, param2:int, param3:IGameObject = null, param4:int = 1, param5:Boolean = false, param6:Point = null, param7:int = 0, param8:Array = null) : void
      {
         this.shooter = param1;
         this.objectModel.camp = param2;
         this.target = param3;
         this.shootDir = param4;
         this.isSpecialSkill = param5;
         this._targetPos = param6;
         this._params = param8;
         if(param7 > 0)
         {
            this.objectModel.roadIndex = param7;
         }
         else if(param1)
         {
            this.objectModel.roadIndex = param1.objectModel.roadIndex;
         }
      }
      
      override public function update() : void
      {
         super.update();
      }
      
      override public function setLocation(param1:Number, param2:Number) : void
      {
         frontLayer.x = param1;
         frontLayer.y = param2;
         TDShadowManager.instance.updateShadowByTDGameObject(this,true,this.bulletData.bulletStaticInfo.isShadowLocateByRoad == 1,0,this.bulletData.bulletStaticInfo.shadowOffSetY);
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         this.shooter = null;
         this.target = null;
         this._pathFunc = null;
         super.dispose(param1);
      }
   }
}
