package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Melee_TakeReward_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Melee_TakeReward_SC";
      
      public static const HASTAKE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Melee_TakeReward_SC.hasTake","hasTake",1 << 3 | WireType.VARINT);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Melee_TakeReward_SC.reward","reward",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var hasTake$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public var reward:Array;
      
      public function Cmd_Melee_TakeReward_SC()
      {
         this.reward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Melee_TakeReward_SC.$MessageID;
      }
      
      public function clearHasTake() : void
      {
         this.hasField$0 &= 4294967294;
         this.hasTake$field = new Boolean();
      }
      
      public function get hasHasTake() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set hasTake(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.hasTake$field = param1;
      }
      
      public function get hasTake() : Boolean
      {
         return this.hasTake$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasHasTake)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTake$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Melee_TakeReward_SC.hasTake cannot be set twice.");
                  }
                  _loc3_++;
                  this.hasTake = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 2:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
