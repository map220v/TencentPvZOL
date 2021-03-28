package com.qq.modules.td.view.game.layer
{
   import com.qq.modules.basic.view.MixLayer;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import org.as3commons.logging.api.getLogger;
   
   public class TDBasicLayer extends MixLayer
   {
       
      
      public function TDBasicLayer()
      {
         super();
      }
      
      public function addGameObjectTolayer(param1:IGameObject, param2:Boolean = false) : void
      {
         if(param1 == null)
         {
            getLogger("TD").debug("增加空对象到显示列表");
            return;
         }
         addComponentToLayer(param1.frontLayer,param2);
      }
   }
}
