package com.qq.modules.unionFuben.model
{
   import com.qq.modules.basic.modle.BasicProxy;
   
   public class UnionFubenRankProxy extends BasicProxy
   {
       
      
      private var _m_curChooseChapterId:int;
      
      public function UnionFubenRankProxy()
      {
         super();
      }
      
      public function get curChooseChapterId() : int
      {
         return this._m_curChooseChapterId;
      }
      
      public function set curChooseChapterId(param1:int) : void
      {
         this._m_curChooseChapterId = param1;
      }
   }
}
