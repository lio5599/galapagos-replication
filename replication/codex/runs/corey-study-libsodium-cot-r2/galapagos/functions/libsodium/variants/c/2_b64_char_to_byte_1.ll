; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.b64_char_to_byte.first = private unnamed_addr constant [3 x i32] [i32 65, i32 97, i32 48], align 4
@__const.b64_char_to_byte.last = private unnamed_addr constant [3 x i32] [i32 90, i32 122, i32 57], align 4
@__const.b64_char_to_byte.base = private unnamed_addr constant [3 x i32] [i32 0, i32 26, i32 52], align 4

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
  %first = alloca [3 x i32], align 4
  %last = alloca [3 x i32], align 4
  %base = alloca [3 x i32], align 4
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  %lo = alloca i32, align 4
  %hi = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %first, ptr align 4 @__const.b64_char_to_byte.first, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %last, ptr align 4 @__const.b64_char_to_byte.last, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %base, ptr align 4 @__const.b64_char_to_byte.base, i64 12, i1 false)
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
  %arrayidx = getelementptr inbounds [3 x i32], ptr %first, i64 0, i64 %idxprom
  %4 = load i32, ptr %arrayidx, align 4
  %sub = sub i32 %2, %4
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %xor = xor i32 255, %and
  store i32 %xor, ptr %lo, align 4
  %5 = load i32, ptr %i, align 4
  %idxprom1 = zext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds [3 x i32], ptr %last, i64 0, i64 %idxprom1
  %6 = load i32, ptr %arrayidx2, align 4
  %7 = load i32, ptr %u, align 4
  %sub3 = sub i32 %6, %7
  %shr4 = lshr i32 %sub3, 8
  %and5 = and i32 %shr4, 255
  %xor6 = xor i32 255, %and5
  store i32 %xor6, ptr %hi, align 4
  %8 = load i32, ptr %lo, align 4
  %9 = load i32, ptr %hi, align 4
  %and7 = and i32 %8, %9
  %10 = load i32, ptr %u, align 4
  %11 = load i32, ptr %i, align 4
  %idxprom8 = zext i32 %11 to i64
  %arrayidx9 = getelementptr inbounds [3 x i32], ptr %first, i64 0, i64 %idxprom8
  %12 = load i32, ptr %arrayidx9, align 4
  %sub10 = sub i32 %10, %12
  %13 = load i32, ptr %i, align 4
  %idxprom11 = zext i32 %13 to i64
  %arrayidx12 = getelementptr inbounds [3 x i32], ptr %base, i64 0, i64 %idxprom11
  %14 = load i32, ptr %arrayidx12, align 4
  %add = add i32 %sub10, %14
  %and13 = and i32 %and7, %add
  %15 = load i32, ptr %x, align 4
  %or = or i32 %15, %and13
  store i32 %or, ptr %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %16 = load i32, ptr %i, align 4
  %inc = add i32 %16, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %17 = load i32, ptr %u, align 4
  %xor14 = xor i32 %17, 43
  %sub15 = sub i32 0, %xor14
  %shr16 = lshr i32 %sub15, 8
  %and17 = and i32 %shr16, 255
  %xor18 = xor i32 255, %and17
  %and19 = and i32 %xor18, 62
  %18 = load i32, ptr %x, align 4
  %or20 = or i32 %18, %and19
  store i32 %or20, ptr %x, align 4
  %19 = load i32, ptr %u, align 4
  %xor21 = xor i32 %19, 47
  %sub22 = sub i32 0, %xor21
  %shr23 = lshr i32 %sub22, 8
  %and24 = and i32 %shr23, 255
  %xor25 = xor i32 255, %and24
  %and26 = and i32 %xor25, 63
  %20 = load i32, ptr %x, align 4
  %or27 = or i32 %20, %and26
  store i32 %or27, ptr %x, align 4
  %21 = load i32, ptr %x, align 4
  %22 = load i32, ptr %x, align 4
  %sub28 = sub i32 0, %22
  %shr29 = lshr i32 %sub28, 8
  %and30 = and i32 %shr29, 255
  %xor31 = xor i32 255, %and30
  %23 = load i32, ptr %u, align 4
  %xor32 = xor i32 %23, 65
  %sub33 = sub i32 0, %xor32
  %shr34 = lshr i32 %sub33, 8
  %and35 = and i32 %shr34, 255
  %and36 = and i32 %xor31, %and35
  %or37 = or i32 %21, %and36
  ret i32 %or37
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
