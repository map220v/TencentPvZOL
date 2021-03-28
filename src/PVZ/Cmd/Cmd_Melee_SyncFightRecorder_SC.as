package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Melee_SyncFightRecorder_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Melee_SyncFightRecorder_SC";
      
      public static const RECORDERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Melee_SyncFightRecorder_SC.recorders","recorders",1 << 3 | WireType.LENGTH_DELIMITED,Dto_MeleeRecorder);
      
      public static const KEYRECORDERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Melee_SyncFightRecorder_SC.keyRecorders","keyRecorders",2 << 3 | WireType.LENGTH_DELIMITED,Dto_MeleeRecorder);
      
      public static const MYRECORDERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Melee_SyncFightRecorder_SC.myRecorders","myRecorders",3 << 3 | WireType.LENGTH_DELIMITED,Dto_MeleeRecorder);
      
      public static const MYINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Melee_SyncFightRecorder_SC.myInfo","myInfo",4 << 3 | WireType.LENGTH_DELIMITED,Dto_MeleeMyInfo);
       
      
      public var recorders:Array;
      
      public var keyRecorders:Array;
      
      public var myRecorders:Array;
      
      private var myInfo$field:Dto_MeleeMyInfo;
      
      public function Cmd_Melee_SyncFightRecorder_SC()
      {
         this.recorders = [];
         this.keyRecorders = [];
         this.myRecorders = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Melee_SyncFightRecorder_SC.$MessageID;
      }
      
      public function clearMyInfo() : void
      {
         this.myInfo$field = null;
      }
      
      public function get hasMyInfo() : Boolean
      {
         return this.myInfo$field != null;
      }
      
      public function set myInfo(param1:Dto_MeleeMyInfo) : void
      {
         this.myInfo$field = param1;
      }
      
      public function get myInfo() : Dto_MeleeMyInfo
      {
         return this.myInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.recorders.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.recorders[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.keyRecorders.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.keyRecorders[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.myRecorders.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.myRecorders[_loc4_]);
            _loc4_++;
         }
         if(this.hasMyInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.myInfo$field);
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
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
                  this.recorders.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_MeleeRecorder()));
                  break;
               case 2:
                  this.keyRecorders.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_MeleeRecorder()));
                  break;
               case 3:
                  this.myRecorders.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_MeleeRecorder()));
                  break;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Melee_SyncFightRecorder_SC.myInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.myInfo = new Dto_MeleeMyInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.myInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
