package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Fuben_SyncStageInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Fuben_SyncStageInfo_SC";
      
      public static const STAGEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Fuben_SyncStageInfo_SC.stageinfo","stageinfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Fuben_StageInfo);
       
      
      private var stageinfo$field:Dto_Fuben_StageInfo;
      
      public function Cmd_Fuben_SyncStageInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Fuben_SyncStageInfo_SC.$MessageID;
      }
      
      public function clearStageinfo() : void
      {
         this.stageinfo$field = null;
      }
      
      public function get hasStageinfo() : Boolean
      {
         return this.stageinfo$field != null;
      }
      
      public function set stageinfo(param1:Dto_Fuben_StageInfo) : void
      {
         this.stageinfo$field = param1;
      }
      
      public function get stageinfo() : Dto_Fuben_StageInfo
      {
         return this.stageinfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasStageinfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.stageinfo$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_Fuben_SyncStageInfo_SC.stageinfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageinfo = new Dto_Fuben_StageInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.stageinfo);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
