; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/0_b64_byte_to_char_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/0_b64_byte_to_char_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.b64_byte_to_char.thresholds = private unnamed_addr constant [3 x i32] [i32 26, i32 52, i32 62], align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %thresholds = alloca [3 x i32], align 4
  %masks = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %result = alloca i32, align 4
  %mask = alloca i32, align 4
  %value = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %thresholds, ptr align 4 @__const.b64_byte_to_char.thresholds, i64 12, i1 false)
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %x.addr, align 4
  %2 = load i32, ptr %i, align 4
  %idxprom = zext i32 %2 to i64
  %arrayidx = getelementptr inbounds [3 x i32], ptr %thresholds, i64 0, i64 %idxprom
  %3 = load i32, ptr %arrayidx, align 4
  %sub = sub i32 %1, %3
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %4 = load i32, ptr %i, align 4
  %idxprom1 = zext i32 %4 to i64
  %arrayidx2 = getelementptr inbounds [3 x i32], ptr %masks, i64 0, i64 %idxprom1
  store i32 %and, ptr %arrayidx2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, ptr %i, align 4
  %inc = add i32 %5, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [3 x i32], ptr %masks, i64 0, i64 0
  %6 = load i32, ptr %arrayidx3, align 4
  %7 = load i32, ptr %x.addr, align 4
  %add = add i32 %7, 65
  %and4 = and i32 %6, %add
  store i32 %and4, ptr %result, align 4
  %arrayidx5 = getelementptr inbounds [3 x i32], ptr %masks, i64 0, i64 1
  %8 = load i32, ptr %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds [3 x i32], ptr %masks, i64 0, i64 0
  %9 = load i32, ptr %arrayidx6, align 4
  %not = xor i32 %9, -1
  %and7 = and i32 %8, %not
  %10 = load i32, ptr %x.addr, align 4
  %add8 = add i32 %10, 71
  %and9 = and i32 %and7, %add8
  %11 = load i32, ptr %result, align 4
  %or = or i32 %11, %and9
  store i32 %or, ptr %result, align 4
  %arrayidx10 = getelementptr inbounds [3 x i32], ptr %masks, i64 0, i64 2
  %12 = load i32, ptr %arrayidx10, align 4
  %arrayidx11 = getelementptr inbounds [3 x i32], ptr %masks, i64 0, i64 1
  %13 = load i32, ptr %arrayidx11, align 4
  %not12 = xor i32 %13, -1
  %and13 = and i32 %12, %not12
  %14 = load i32, ptr %x.addr, align 4
  %add14 = add i32 %14, -4
  %and15 = and i32 %and13, %add14
  %15 = load i32, ptr %result, align 4
  %or16 = or i32 %15, %and15
  store i32 %or16, ptr %result, align 4
  store i32 62, ptr %i, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc27, %for.end
  %16 = load i32, ptr %i, align 4
  %cmp18 = icmp ule i32 %16, 63
  br i1 %cmp18, label %for.body19, label %for.end29

for.body19:                                       ; preds = %for.cond17
  %17 = load i32, ptr %x.addr, align 4
  %18 = load i32, ptr %i, align 4
  %xor = xor i32 %17, %18
  %sub20 = sub i32 0, %xor
  %shr21 = lshr i32 %sub20, 8
  %not22 = xor i32 %shr21, -1
  %and23 = and i32 %not22, 255
  store i32 %and23, ptr %mask, align 4
  %19 = load i32, ptr %i, align 4
  %cmp24 = icmp eq i32 %19, 62
  %20 = zext i1 %cmp24 to i64
  %cond = select i1 %cmp24, i32 43, i32 47
  store i32 %cond, ptr %value, align 4
  %21 = load i32, ptr %mask, align 4
  %22 = load i32, ptr %value, align 4
  %and25 = and i32 %21, %22
  %23 = load i32, ptr %result, align 4
  %or26 = or i32 %23, %and25
  store i32 %or26, ptr %result, align 4
  br label %for.inc27

for.inc27:                                        ; preds = %for.body19
  %24 = load i32, ptr %i, align 4
  %inc28 = add i32 %24, 1
  store i32 %inc28, ptr %i, align 4
  br label %for.cond17, !llvm.loop !8

for.end29:                                        ; preds = %for.cond17
  %25 = load i32, ptr %result, align 4
  ret i32 %25
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

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
!8 = distinct !{!8, !7}
