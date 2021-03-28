package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Fuben_Sweep_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Fuben_Sweep_CS";
      
      public static const CHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Fuben_Sweep_CS.chapterid","chapterid",1 << 3 | WireType.VARINT);
      
      public static const MODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Fuben_Sweep_CS.modeid","modeid",2 << 3 | WireType.VARINT);
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Fuben_Sweep_CS.stageid","stageid",3 << 3 | WireType.VARINT);
      
      public static const TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Fuben_Sweep_CS.times","times",4 << 3 | WireType.VARINT);
      
      public static const MULTISWEEP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Fuben_Sweep_CS.multiSweep","multiSweep",5 << 3 | WireType.VARINT);
       
      
      private var chapterid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var modeid$field:uint;
      
      private var stageid$field:uint;
      
      private var times$field:uint;
      
      private var multiSweep$field:Boolean;
      
      public function Cmd_Fuben_Sweep_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Fuben_Sweep_CS.$MessageID;
      }
      
      public function clearChapterid() : void
      {
         this.hasField$0 &= 4294967294;
         this.chapterid$field = new uint();
      }
      
      public function get hasChapterid() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set chapterid(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.chapterid$field = param1;
      }
      
      public function get chapterid() : uint
      {
         return this.chapterid$field;
      }
      
      public function clearModeid() : void
      {
         this.hasField$0 &= 4294967293;
         this.modeid$field = new uint();
      }
      
      public function get hasModeid() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set modeid(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.modeid$field = param1;
      }
      
      public function get modeid() : uint
      {
         return this.modeid$field;
      }
      
      public function clearStageid() : void
      {
         this.hasField$0 &= 4294967291;
         this.stageid$field = new uint();
      }
      
      public function get hasStageid() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set stageid(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.stageid$field = param1;
      }
      
      public function get stageid() : uint
      {
         return this.stageid$field;
      }
      
      public function clearTimes() : void
      {
         this.hasField$0 &= 4294967287;
         this.times$field = new uint();
      }
      
      public function get hasTimes() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set times(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.times$field = param1;
      }
      
      public function get times() : uint
      {
         return this.times$field;
      }
      
      public function clearMultiSweep() : void
      {
         this.hasField$0 &= 4294967279;
         this.multiSweep$field = new Boolean();
      }
      
      public function get hasMultiSweep() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set multiSweep(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.multiSweep$field = param1;
      }
      
      public function get multiSweep() : Boolean
      {
         return this.multiSweep$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasChapterid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.chapterid$field);
         }
         if(this.hasModeid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.modeid$field);
         }
         if(this.hasStageid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.stageid$field);
         }
         if(this.hasTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.times$field);
         }
         if(this.hasMultiSweep)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.multiSweep$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Fuben_Sweep_CS.chapterid cannot be set twice.");
                  }
                  _loc3_++;
                  this.chapterid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Fuben_Sweep_CS.modeid cannot be set twice.");
                  }
                  _loc4_++;
                  this.modeid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Fuben_Sweep_CS.stageid cannot be set twice.");
                  }
                  _loc5_++;
                  this.stageid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Fuben_Sweep_CS.times cannot be set twice.");
                  }
                  _loc6_++;
                  this.times = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Fuben_Sweep_CS.multiSweep cannot be set twice.");
                  }
                  _loc7_++;
                  this.multiSweep = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
