; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b64_byte_to_urlsafe_char.len = internal constant [5 x i8] c"\1A\1A\0A\01\01", align 1
@b64_byte_to_urlsafe_char.base = internal constant [5 x i8] c"Aa0-_", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  store i32 %0, ptr %r, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %1, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %r, align 4
  %3 = load i32, ptr %i, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds [5 x i8], ptr @b64_byte_to_urlsafe_char.len, i64 0, i64 %idxprom
  %4 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %4 to i32
  %cmp1 = icmp ult i32 %2, %conv
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32, ptr %i, align 4
  %idxprom3 = zext i32 %5 to i64
  %arrayidx4 = getelementptr inbounds [5 x i8], ptr @b64_byte_to_urlsafe_char.base, i64 0, i64 %idxprom3
  %6 = load i8, ptr %arrayidx4, align 1
  %conv5 = zext i8 %6 to i32
  %7 = load i32, ptr %r, align 4
  %add = add i32 %conv5, %7
  store i32 %add, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  %8 = load i32, ptr %i, align 4
  %idxprom6 = zext i32 %8 to i64
  %arrayidx7 = getelementptr inbounds [5 x i8], ptr @b64_byte_to_urlsafe_char.len, i64 0, i64 %idxprom6
  %9 = load i8, ptr %arrayidx7, align 1
  %conv8 = zext i8 %9 to i32
  %10 = load i32, ptr %r, align 4
  %sub = sub i32 %10, %conv8
  store i32 %sub, ptr %r, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32, ptr %i, align 4
  %inc = add i32 %11, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %12 = load i32, ptr %retval, align 4
  ret i32 %12
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
