package tencent.tools.behaviourTrees.core
{
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class SequenceNode extends BaseNode
   {
       
      
      public function SequenceNode()
      {
         super();
         this.nodeType = BehaviourTreeNodeType.SEQUENCE;
      }
      
      override public function calculate() : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc1_:int = 0;
         while(_loc1_ < this.childNodeNum)
         {
            _loc2_ = this.childNodes[_loc1_].calculate();
            if(_loc2_ == false)
            {
               return false;
            }
            _loc1_++;
         }
         return true;
      }
   }
}
