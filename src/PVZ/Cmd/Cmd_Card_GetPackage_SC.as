package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Card_GetPackage_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_GetPackage_SC";
      
      public static const ALL:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Card_GetPackage_SC.all","all",1 << 3 | WireType.LENGTH_DELIMITED,Dto_CardFullInfo);
      
      public static const LEADERADDPARAM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Card_GetPackage_SC.leaderAddParam","leaderAddParam",2 << 3 | WireType.VARINT);
       
      
      public var all:Array;
      
      private var leaderAddParam$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Card_GetPackage_SC()
      {
         this.all = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_GetPackage_SC.$MessageID;
      }
      
      public function clearLeaderAddParam() : void
      {
         this.hasField$0 &= 4294967294;
         this.leaderAddParam$field = new uint();
      }
      
      public function get hasLeaderAddParam() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set leaderAddParam(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.leaderAddParam$field = param1;
      }
      
      public function get leaderAddParam() : uint
      {
         return this.leaderAddParam$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.all.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.all[_loc2_]);
            _loc2_++;
         }
         if(this.hasLeaderAddParam)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.leaderAddParam$field);
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
                  this.all.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CardFullInfo()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_GetPackage_SC.leaderAddParam cannot be set twice.");
                  }
                  _loc3_++;
                  this.leaderAddParam = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
