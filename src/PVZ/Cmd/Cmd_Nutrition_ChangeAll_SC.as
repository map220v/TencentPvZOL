package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Nutrition_ChangeAll_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Nutrition_ChangeAll_SC";
      
      public static const OLDEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_ChangeAll_SC.oldExp","oldExp",1 << 3 | WireType.VARINT);
      
      public static const NEWEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_ChangeAll_SC.newExp","newExp",2 << 3 | WireType.VARINT);
      
      public static const GOLDREAGENTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_ChangeAll_SC.goldReagentNum","goldReagentNum",3 << 3 | WireType.VARINT);
      
      public static const REMAINREAGENT:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Nutrition_ChangeAll_SC.remainReagent","remainReagent",4 << 3 | WireType.VARINT);
       
      
      private var oldExp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var newExp$field:uint;
      
      private var goldReagentNum$field:uint;
      
      public var remainReagent:Array;
      
      public function Cmd_Nutrition_ChangeAll_SC()
      {
         this.remainReagent = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Nutrition_ChangeAll_SC.$MessageID;
      }
      
      public function clearOldExp() : void
      {
         this.hasField$0 &= 4294967294;
         this.oldExp$field = new uint();
      }
      
      public function get hasOldExp() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set oldExp(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.oldExp$field = param1;
      }
      
      public function get oldExp() : uint
      {
         return this.oldExp$field;
      }
      
      public function clearNewExp() : void
      {
         this.hasField$0 &= 4294967293;
         this.newExp$field = new uint();
      }
      
      public function get hasNewExp() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set newExp(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.newExp$field = param1;
      }
      
      public function get newExp() : uint
      {
         return this.newExp$field;
      }
      
      public function clearGoldReagentNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.goldReagentNum$field = new uint();
      }
      
      public function get hasGoldReagentNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set goldReagentNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.goldReagentNum$field = param1;
      }
      
      public function get goldReagentNum() : uint
      {
         return this.goldReagentNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasOldExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.oldExp$field);
         }
         if(this.hasNewExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.newExp$field);
         }
         if(this.hasGoldReagentNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.goldReagentNum$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.remainReagent.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.remainReagent[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_ChangeAll_SC.oldExp cannot be set twice.");
                  }
                  _loc3_++;
                  this.oldExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_ChangeAll_SC.newExp cannot be set twice.");
                  }
                  _loc4_++;
                  this.newExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Nutrition_ChangeAll_SC.goldReagentNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.goldReagentNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if((_loc6_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.remainReagent);
                  }
                  else
                  {
                     this.remainReagent.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
