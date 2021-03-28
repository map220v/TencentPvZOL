package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_SyncAasInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SyncAasInfo_SC";
      
      public static const AASADULTTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_SyncAasInfo_SC.aasAdultType","aasAdultType",1 << 3 | WireType.VARINT,E_AasAdultType);
      
      public static const AASSTATE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_SyncAasInfo_SC.aasState","aasState",2 << 3 | WireType.VARINT,E_AasState);
      
      public static const ONLINETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SyncAasInfo_SC.onlineTime","onlineTime",3 << 3 | WireType.VARINT);
       
      
      private var aasAdultType$field:int;
      
      private var hasField$0:uint = 0;
      
      private var aasState$field:int;
      
      private var onlineTime$field:uint;
      
      public function Cmd_SyncAasInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SyncAasInfo_SC.$MessageID;
      }
      
      public function clearAasAdultType() : void
      {
         this.hasField$0 &= 4294967294;
         this.aasAdultType$field = new int();
      }
      
      public function get hasAasAdultType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set aasAdultType(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.aasAdultType$field = param1;
      }
      
      public function get aasAdultType() : int
      {
         return this.aasAdultType$field;
      }
      
      public function clearAasState() : void
      {
         this.hasField$0 &= 4294967293;
         this.aasState$field = new int();
      }
      
      public function get hasAasState() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set aasState(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.aasState$field = param1;
      }
      
      public function get aasState() : int
      {
         return this.aasState$field;
      }
      
      public function clearOnlineTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.onlineTime$field = new uint();
      }
      
      public function get hasOnlineTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set onlineTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.onlineTime$field = param1;
      }
      
      public function get onlineTime() : uint
      {
         return this.onlineTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasAasAdultType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.aasAdultType$field);
         }
         if(this.hasAasState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_ENUM(param1,this.aasState$field);
         }
         if(this.hasOnlineTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.onlineTime$field);
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
                     throw new IOError("Bad data format: Cmd_SyncAasInfo_SC.aasAdultType cannot be set twice.");
                  }
                  _loc3_++;
                  this.aasAdultType = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SyncAasInfo_SC.aasState cannot be set twice.");
                  }
                  _loc4_++;
                  this.aasState = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SyncAasInfo_SC.onlineTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.onlineTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
