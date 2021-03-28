package com.qq.modules.guide.view
{
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.guide.model.vo.GuideDialogueVO;
   import com.qq.utils.lua.Lua;
   
   public class GuideDialogue extends GuideDaveTalkCt
   {
      
      public static var instance:GuideDialogue;
       
      
      public function GuideDialogue(param1:GuideDialogueVO)
      {
         if(instance)
         {
            instance.Dispose();
         }
         instance = this;
         super(param1,GuideDialogueMediator);
         Lua.guideWdId = this.id;
      }
      
      override public function Close() : void
      {
         GuideCmd.clearArrows();
         GuideCmd.clearArea();
         super.Close();
      }
      
      override public function Dispose() : void
      {
         instance = null;
         super.Dispose();
      }
   }
}
