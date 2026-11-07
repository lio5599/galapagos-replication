; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.b64_char_to_byte.range = private unnamed_addr constant [3 x [3 x i32]] [[3 x i32] [i32 65, i32 90, i32 0], [3 x i32] [i32 97, i32 122, i32 26], [3 x i32] [i32 48, i32 57, i32 52]], align 16
@__const.b64_char_to_byte.symbol = private unnamed_addr constant [2 x [2 x i32]] [[2 x i32] [i32 43, i32 62], [2 x i32] [i32 47, i32 63]], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %range = alloca [3 x [3 x i32]], align 16
  %symbol = alloca [2 x [2 x i32]], align 16
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %range, ptr align 16 @__const.b64_char_to_byte.range, i64 36, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %symbol, ptr align 16 @__const.b64_char_to_byte.symbol, i64 16, i1 false)
  store i32 0, ptr %x, align 4
  store i32 2, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32, ptr %i, align 4
  %cmp = icmp ne i32 %1, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, ptr %i, align 4
  %dec = add i32 %2, -1
  store i32 %dec, ptr %i, align 4
  %3 = load i32, ptr %u, align 4
  %4 = load i32, ptr %i, align 4
  %idxprom = zext i32 %4 to i64
  %arrayidx = getelementptr inbounds [2 x [2 x i32]], ptr %symbol, i64 0, i64 %idxprom
  %arrayidx1 = getelementptr inbounds [2 x i32], ptr %arrayidx, i64 0, i64 0
  %5 = load i32, ptr %arrayidx1, align 8
  %xor = xor i32 %3, %5
  %sub = sub i32 0, %xor
  %not = xor i32 %sub, -1
  %shr = lshr i32 %not, 8
  %and = and i32 %shr, 255
  %6 = load i32, ptr %i, align 4
  %idxprom2 = zext i32 %6 to i64
  %arrayidx3 = getelementptr inbounds [2 x [2 x i32]], ptr %symbol, i64 0, i64 %idxprom2
  %arrayidx4 = getelementptr inbounds [2 x i32], ptr %arrayidx3, i64 0, i64 1
  %7 = load i32, ptr %arrayidx4, align 4
  %and5 = and i32 %and, %7
  %8 = load i32, ptr %x, align 4
  %or = or i32 %8, %and5
  store i32 %or, ptr %x, align 4
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  store i32 3, ptr %i, align 4
  br label %while.cond6

while.cond6:                                      ; preds = %while.body8, %while.end
  %9 = load i32, ptr %i, align 4
  %cmp7 = icmp ne i32 %9, 0
  br i1 %cmp7, label %while.body8, label %while.end31

while.body8:                                      ; preds = %while.cond6
  %10 = load i32, ptr %i, align 4
  %dec9 = add i32 %10, -1
  store i32 %dec9, ptr %i, align 4
  %11 = load i32, ptr %u, align 4
  %12 = load i32, ptr %i, align 4
  %idxprom10 = zext i32 %12 to i64
  %arrayidx11 = getelementptr inbounds [3 x [3 x i32]], ptr %range, i64 0, i64 %idxprom10
  %arrayidx12 = getelementptr inbounds [3 x i32], ptr %arrayidx11, i64 0, i64 0
  %13 = load i32, ptr %arrayidx12, align 4
  %sub13 = sub i32 %11, %13
  %14 = load i32, ptr %i, align 4
  %idxprom14 = zext i32 %14 to i64
  %arrayidx15 = getelementptr inbounds [3 x [3 x i32]], ptr %range, i64 0, i64 %idxprom14
  %arrayidx16 = getelementptr inbounds [3 x i32], ptr %arrayidx15, i64 0, i64 1
  %15 = load i32, ptr %arrayidx16, align 4
  %16 = load i32, ptr %u, align 4
  %sub17 = sub i32 %15, %16
  %or18 = or i32 %sub13, %sub17
  %not19 = xor i32 %or18, -1
  %shr20 = lshr i32 %not19, 8
  %and21 = and i32 %shr20, 255
  %17 = load i32, ptr %u, align 4
  %18 = load i32, ptr %i, align 4
  %idxprom22 = zext i32 %18 to i64
  %arrayidx23 = getelementptr inbounds [3 x [3 x i32]], ptr %range, i64 0, i64 %idxprom22
  %arrayidx24 = getelementptr inbounds [3 x i32], ptr %arrayidx23, i64 0, i64 0
  %19 = load i32, ptr %arrayidx24, align 4
  %sub25 = sub i32 %17, %19
  %20 = load i32, ptr %i, align 4
  %idxprom26 = zext i32 %20 to i64
  %arrayidx27 = getelementptr inbounds [3 x [3 x i32]], ptr %range, i64 0, i64 %idxprom26
  %arrayidx28 = getelementptr inbounds [3 x i32], ptr %arrayidx27, i64 0, i64 2
  %21 = load i32, ptr %arrayidx28, align 4
  %add = add i32 %sub25, %21
  %and29 = and i32 %and21, %add
  %22 = load i32, ptr %x, align 4
  %or30 = or i32 %22, %and29
  store i32 %or30, ptr %x, align 4
  br label %while.cond6, !llvm.loop !8

while.end31:                                      ; preds = %while.cond6
  %23 = load i32, ptr %x, align 4
  %24 = load i32, ptr %x, align 4
  %sub32 = sub i32 0, %24
  %shr33 = lshr i32 %sub32, 8
  %and34 = and i32 %shr33, 255
  %xor35 = xor i32 255, %and34
  %25 = load i32, ptr %u, align 4
  %xor36 = xor i32 %25, 65
  %sub37 = sub i32 0, %xor36
  %shr38 = lshr i32 %sub37, 8
  %and39 = and i32 %shr38, 255
  %and40 = and i32 %xor35, %and39
  %or41 = or i32 %23, %and40
  ret i32 %or41
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
