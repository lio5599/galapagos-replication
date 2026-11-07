; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/2_b64_char_to_byte_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/2_b64_char_to_byte_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.b64_char_to_byte.low = private unnamed_addr constant [3 x i32] [i32 65, i32 97, i32 48], align 4
@__const.b64_char_to_byte.high = private unnamed_addr constant [3 x i32] [i32 90, i32 122, i32 57], align 4
@__const.b64_char_to_byte.offset = private unnamed_addr constant [3 x i32] [i32 0, i32 26, i32 52], align 4

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
  %low = alloca [3 x i32], align 4
  %high = alloca [3 x i32], align 4
  %offset = alloca [3 x i32], align 4
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  %mask = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %low, ptr align 4 @__const.b64_char_to_byte.low, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %high, ptr align 4 @__const.b64_char_to_byte.high, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %offset, ptr align 4 @__const.b64_char_to_byte.offset, i64 12, i1 false)
  store i32 0, ptr %x, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %1, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %u, align 4
  %3 = load i32, ptr %i, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds [3 x i32], ptr %low, i64 0, i64 %idxprom
  %4 = load i32, ptr %arrayidx, align 4
  %sub = sub i32 %2, %4
  %shr = lshr i32 %sub, 8
  %5 = load i32, ptr %i, align 4
  %idxprom1 = zext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds [3 x i32], ptr %high, i64 0, i64 %idxprom1
  %6 = load i32, ptr %arrayidx2, align 4
  %7 = load i32, ptr %u, align 4
  %sub3 = sub i32 %6, %7
  %shr4 = lshr i32 %sub3, 8
  %or = or i32 %shr, %shr4
  %not = xor i32 %or, -1
  %and = and i32 %not, 255
  store i32 %and, ptr %mask, align 4
  %8 = load i32, ptr %mask, align 4
  %9 = load i32, ptr %u, align 4
  %10 = load i32, ptr %i, align 4
  %idxprom5 = zext i32 %10 to i64
  %arrayidx6 = getelementptr inbounds [3 x i32], ptr %low, i64 0, i64 %idxprom5
  %11 = load i32, ptr %arrayidx6, align 4
  %sub7 = sub i32 %9, %11
  %12 = load i32, ptr %i, align 4
  %idxprom8 = zext i32 %12 to i64
  %arrayidx9 = getelementptr inbounds [3 x i32], ptr %offset, i64 0, i64 %idxprom8
  %13 = load i32, ptr %arrayidx9, align 4
  %add = add i32 %sub7, %13
  %and10 = and i32 %8, %add
  %14 = load i32, ptr %x, align 4
  %or11 = or i32 %14, %and10
  store i32 %or11, ptr %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %15 = load i32, ptr %i, align 4
  %inc = add i32 %15, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %16 = load i32, ptr %u, align 4
  %xor = xor i32 %16, 43
  %sub12 = sub i32 0, %xor
  %shr13 = lshr i32 %sub12, 8
  %not14 = xor i32 %shr13, -1
  %and15 = and i32 %not14, 62
  %17 = load i32, ptr %x, align 4
  %or16 = or i32 %17, %and15
  store i32 %or16, ptr %x, align 4
  %18 = load i32, ptr %u, align 4
  %xor17 = xor i32 %18, 47
  %sub18 = sub i32 0, %xor17
  %shr19 = lshr i32 %sub18, 8
  %not20 = xor i32 %shr19, -1
  %and21 = and i32 %not20, 63
  %19 = load i32, ptr %x, align 4
  %or22 = or i32 %19, %and21
  store i32 %or22, ptr %x, align 4
  %20 = load i32, ptr %x, align 4
  %21 = load i32, ptr %x, align 4
  %sub23 = sub i32 0, %21
  %shr24 = lshr i32 %sub23, 8
  %not25 = xor i32 %shr24, -1
  %and26 = and i32 %not25, 255
  %22 = load i32, ptr %u, align 4
  %xor27 = xor i32 %22, 65
  %sub28 = sub i32 0, %xor27
  %shr29 = lshr i32 %sub28, 8
  %and30 = and i32 %shr29, 255
  %and31 = and i32 %and26, %and30
  %or32 = or i32 %20, %and31
  ret i32 %or32
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
