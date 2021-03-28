package asgui.events
{
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.display.IBlitDisplayObject;
   import flash.events.Event;
   
   public class FrameEvent extends Event
   {
      
      public static const MOVEMENT_FRAME_EVENT:String = "movementFrameEvent";
      
      public static const BONE_FRAME_EVENT:String = "boneFrameEvent";
       
      
      public var movementID:String;
      
      public var frameLabel:String;
      
      private var _bone:IBlitDisplayObject;
      
      public function FrameEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:IBlitDisplayObject = null)
      {
         super(param1,param2,param3);
         this._bone = param4;
      }
      
      public function get anim() : BlitBoneAnim
      {
         return target as BlitBoneAnim;
      }
      
      public function get bone() : IBlitDisplayObject
      {
         return this._bone;
      }
      
      override public function clone() : Event
      {
         var _loc1_:FrameEvent = new FrameEvent(type,cancelable);
         _loc1_.movementID = this.movementID;
         _loc1_.frameLabel = this.frameLabel;
         _loc1_._bone = this._bone;
         return _loc1_;
      }
   }
}
