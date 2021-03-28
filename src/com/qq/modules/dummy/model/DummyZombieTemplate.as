package com.qq.modules.dummy.model
{
   import com.qq.GameGloble;
   import com.qq.modules.dummy.model.templates.ce.DummyZombieTemplateCE;
   
   public class DummyZombieTemplate extends DummyZombieTemplateCE
   {
       
      
      public function DummyZombieTemplate()
      {
         super();
      }
      
      public function get unitAssetName() : String
      {
         return resName + GameGloble.BONE_FILE_EXT_POINT;
      }
   }
}
