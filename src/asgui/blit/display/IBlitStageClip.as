package asgui.blit.display
{
   public interface IBlitStageClip extends IBlitClip
   {
       
      
      function get frameCount() : Number;
      
      function set frameCount(param1:Number) : void;
      
      function AdvanceTime(param1:Number) : void;
   }
}
