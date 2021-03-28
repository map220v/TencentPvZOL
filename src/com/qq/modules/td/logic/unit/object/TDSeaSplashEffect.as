package com.qq.modules.td.logic.unit.object
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   
   public class TDSeaSplashEffect extends TDNormalObject
   {
       
      
      private var m_followedObj:IGameObject;
      
      public function TDSeaSplashEffect()
      {
         super();
      }
      
      public function startFollow() : void
      {
         if(this.m_followedObj != null)
         {
            setAction(TDConstant.TDSeaSplashEffect_Follow);
         }
      }
      
      public function endFollow() : void
      {
         setAction();
      }
      
      public function get followedObj() : IGameObject
      {
         return this.m_followedObj;
      }
      
      public function set followedObj(param1:IGameObject) : void
      {
         this.m_followedObj = param1;
      }
   }
}
