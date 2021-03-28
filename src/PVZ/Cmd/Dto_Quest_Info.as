package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Quest_Info extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Quest_Info";
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Quest_Info.id","id",1 << 3 | WireType.VARINT);
      
      public static const STATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Quest_Info.state","state",2 << 3 | WireType.VARINT);
      
      public static const CURRSTEP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Quest_Info.currStep","currStep",3 << 3 | WireType.VARINT);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var state$field:uint;
      
      private var currStep$field:uint;
      
      public function Dto_Quest_Info()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Quest_Info.$MessageID;
      }
      
      public function clearId() : void
      {
         this.hasField$0 &= 4294967294;
         this.id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.id$field = param1;
      }
      
      public function get id() : uint
      {
         return this.id$field;
      }
      
      public function clearState() : void
      {
         this.hasField$0 &= 4294967293;
         this.state$field = new uint();
      }
      
      public function get hasState() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set state(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.state$field = param1;
      }
      
      public function get state() : uint
      {
         return this.state$field;
      }
      
      public function clearCurrStep() : void
      {
         this.hasField$0 &= 4294967291;
         this.currStep$field = new uint();
      }
      
      public function get hasCurrStep() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set currStep(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.currStep$field = param1;
      }
      
      public function get currStep() : uint
      {
         return this.currStep$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.id$field);
         }
         if(this.hasState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.state$field);
         }
         if(this.hasCurrStep)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.currStep$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Dto_Quest_Info.id cannot be set twice.");
                  }
                  _loc3_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Quest_Info.state cannot be set twice.");
                  }
                  _loc4_++;
                  this.state = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Quest_Info.currStep cannot be set twice.");
                  }
                  _loc5_++;
                  this.currStep = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
