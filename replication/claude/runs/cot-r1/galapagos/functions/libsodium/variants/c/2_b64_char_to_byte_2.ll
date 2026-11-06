; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_2.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b64_char_to_byte.alphabet = internal constant [65 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\00", align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %w = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  %and = and i32 %0, 65535
  store i32 %and, ptr %w, align 4
  %1 = load i32, ptr %w, align 4
  %cmp = icmp uge i32 %1, 65280
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %w, align 4
  %and1 = and i32 %2, 255
  %cmp2 = icmp eq i32 %and1, 47
  %3 = zext i1 %cmp2 to i64
  %cond = select i1 %cmp2, i32 62, i32 63
  store i32 %cond, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, ptr %i, align 4
  %cmp3 = icmp ult i32 %4, 64
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32, ptr %i, align 4
  %idxprom = zext i32 %5 to i64
  %arrayidx = getelementptr inbounds [65 x i8], ptr @b64_char_to_byte.alphabet, i64 0, i64 %idxprom
  %6 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %6 to i32
  %7 = load i32, ptr %w, align 4
  %cmp4 = icmp eq i32 %conv, %7
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %for.body
  %8 = load i32, ptr %i, align 4
  store i32 %8, ptr %retval, align 4
  br label %return

if.end7:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end7
  %9 = load i32, ptr %i, align 4
  %inc = add i32 %9, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i32 255, ptr %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then6, %if.then
  %10 = load i32, ptr %retval, align 4
  ret i32 %10
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
