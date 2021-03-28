package org.robotlegs.extend.command
{
   import org.robotlegs.mvcs.Command;
   
   public class StrongRobotlegCommand extends Command
   {
       
      
      [Inject]
      public var event:StrongRobotlegCommandEvent;
      
      public function StrongRobotlegCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc2_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:Function = null;
         var _loc1_:StrongRobotlegCommandEvent = this.event;
         var _loc3_:int = _loc1_.map.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc1_.map[_loc2_];
            (_loc5_ = this[_loc4_.name] as Function).apply(this,_loc4_.arg);
            _loc2_++;
         }
      }
   }
}
