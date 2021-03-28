package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_SecondPwd_Info_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SecondPwd_Info_SC";
      
      public static const BRESET:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_SecondPwd_Info_SC.bReset","bReset",1 << 3 | WireType.VARINT);
      
      public static const SYSTEM:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SecondPwd_Info_SC.system","system",2 << 3 | WireType.VARINT);
      
      public static const HASPWD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_SecondPwd_Info_SC.hasPwd","hasPwd",3 << 3 | WireType.VARINT);
      
      public static const INPUT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_SecondPwd_Info_SC.input","input",4 << 3 | WireType.VARINT);
      
      public static const RESETTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SecondPwd_Info_SC.resetTime","resetTime",5 << 3 | WireType.VARINT);
      
      public static const TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SecondPwd_Info_SC.times","times",6 << 3 | WireType.VARINT);
      
      public static const ISEXCEED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_SecondPwd_Info_SC.isexceed","isexceed",7 << 3 | WireType.VARINT);
      
      public static const ISFREEZE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_SecondPwd_Info_SC.isfreeze","isfreeze",8 << 3 | WireType.VARINT);
       
      
      private var bReset$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public var system:Array;
      
      private var hasPwd$field:Boolean;
      
      private var input$field:Boolean;
      
      private var resetTime$field:uint;
      
      private var times$field:uint;
      
      private var isexceed$field:Boolean;
      
      private var isfreeze$field:Boolean;
      
      public function Cmd_SecondPwd_Info_SC()
      {
         this.system = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SecondPwd_Info_SC.$MessageID;
      }
      
      public function clearBReset() : void
      {
         this.hasField$0 &= 4294967294;
         this.bReset$field = new Boolean();
      }
      
      public function get hasBReset() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set bReset(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.bReset$field = param1;
      }
      
      public function get bReset() : Boolean
      {
         return this.bReset$field;
      }
      
      public function clearHasPwd() : void
      {
         this.hasField$0 &= 4294967293;
         this.hasPwd$field = new Boolean();
      }
      
      public function get hasHasPwd() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set hasPwd(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.hasPwd$field = param1;
      }
      
      public function get hasPwd() : Boolean
      {
         return this.hasPwd$field;
      }
      
      public function clearInput() : void
      {
         this.hasField$0 &= 4294967291;
         this.input$field = new Boolean();
      }
      
      public function get hasInput() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set input(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.input$field = param1;
      }
      
      public function get input() : Boolean
      {
         return this.input$field;
      }
      
      public function clearResetTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.resetTime$field = new uint();
      }
      
      public function get hasResetTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set resetTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.resetTime$field = param1;
      }
      
      public function get resetTime() : uint
      {
         return this.resetTime$field;
      }
      
      public function clearTimes() : void
      {
         this.hasField$0 &= 4294967279;
         this.times$field = new uint();
      }
      
      public function get hasTimes() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set times(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.times$field = param1;
      }
      
      public function get times() : uint
      {
         return this.times$field;
      }
      
      public function clearIsexceed() : void
      {
         this.hasField$0 &= 4294967263;
         this.isexceed$field = new Boolean();
      }
      
      public function get hasIsexceed() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set isexceed(param1:Boolean) : void
      {
         this.hasField$0 |= 32;
         this.isexceed$field = param1;
      }
      
      public function get isexceed() : Boolean
      {
         return this.isexceed$field;
      }
      
      public function clearIsfreeze() : void
      {
         this.hasField$0 &= 4294967231;
         this.isfreeze$field = new Boolean();
      }
      
      public function get hasIsfreeze() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set isfreeze(param1:Boolean) : void
      {
         this.hasField$0 |= 64;
         this.isfreeze$field = param1;
      }
      
      public function get isfreeze() : Boolean
      {
         return this.isfreeze$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasBReset)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.bReset$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.system.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.system[_loc2_]);
            _loc2_++;
         }
         if(this.hasHasPwd)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.hasPwd$field);
         }
         if(this.hasInput)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.input$field);
         }
         if(this.hasResetTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.resetTime$field);
         }
         if(this.hasTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.times$field);
         }
         if(this.hasIsexceed)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.isexceed$field);
         }
         if(this.hasIsfreeze)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_BOOL(param1,this.isfreeze$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc10_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc10_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SecondPwd_Info_SC.bReset cannot be set twice.");
                  }
                  _loc3_++;
                  this.bReset = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 2:
                  if((_loc10_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.system);
                  }
                  else
                  {
                     this.system.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SecondPwd_Info_SC.hasPwd cannot be set twice.");
                  }
                  _loc4_++;
                  this.hasPwd = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SecondPwd_Info_SC.input cannot be set twice.");
                  }
                  _loc5_++;
                  this.input = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SecondPwd_Info_SC.resetTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.resetTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SecondPwd_Info_SC.times cannot be set twice.");
                  }
                  _loc7_++;
                  this.times = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SecondPwd_Info_SC.isexceed cannot be set twice.");
                  }
                  _loc8_++;
                  this.isexceed = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SecondPwd_Info_SC.isfreeze cannot be set twice.");
                  }
                  _loc9_++;
                  this.isfreeze = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
