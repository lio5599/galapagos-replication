; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/2_b64_char_to_byte_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/2_b64_char_to_byte_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.b64_char_to_byte.lo = private unnamed_addr constant [3 x i32] [i32 65, i32 97, i32 48], align 4
@__const.b64_char_to_byte.hi = private unnamed_addr constant [3 x i32] [i32 90, i32 122, i32 57], align 4
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
  %lo = alloca [3 x i32], align 4
  %hi = alloca [3 x i32], align 4
  %offset = alloca [3 x i32], align 4
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  %lower = alloca i32, align 4
  %upper = alloca i32, align 4
  %mask = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %lo, ptr align 4 @__const.b64_char_to_byte.lo, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %hi, ptr align 4 @__const.b64_char_to_byte.hi, i64 12, i1 false)
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
  %arrayidx = getelementptr inbounds [3 x i32], ptr %lo, i64 0, i64 %idxprom
  %4 = load i32, ptr %arrayidx, align 4
  %sub = sub i32 %2, %4
  store i32 %sub, ptr %lower, align 4
  %5 = load i32, ptr %i, align 4
  %idxprom1 = zext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds [3 x i32], ptr %hi, i64 0, i64 %idxprom1
  %6 = load i32, ptr %arrayidx2, align 4
  %7 = load i32, ptr %u, align 4
  %sub3 = sub i32 %6, %7
  store i32 %sub3, ptr %upper, align 4
  %8 = load i32, ptr %lower, align 4
  %9 = load i32, ptr %upper, align 4
  %or = or i32 %8, %9
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  %and = and i32 %not, 255
  store i32 %and, ptr %mask, align 4
  %10 = load i32, ptr %mask, align 4
  %11 = load i32, ptr %lower, align 4
  %12 = load i32, ptr %i, align 4
  %idxprom4 = zext i32 %12 to i64
  %arrayidx5 = getelementptr inbounds [3 x i32], ptr %offset, i64 0, i64 %idxprom4
  %13 = load i32, ptr %arrayidx5, align 4
  %add = add i32 %11, %13
  %and6 = and i32 %10, %add
  %14 = load i32, ptr %x, align 4
  %or7 = or i32 %14, %and6
  store i32 %or7, ptr %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %15 = load i32, ptr %i, align 4
  %inc = add i32 %15, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %16 = load i32, ptr %u, align 4
  %xor = xor i32 %16, 43
  %sub8 = sub i32 0, %xor
  %shr9 = lshr i32 %sub8, 8
  %not10 = xor i32 %shr9, -1
  %and11 = and i32 %not10, 62
  %17 = load i32, ptr %x, align 4
  %or12 = or i32 %17, %and11
  store i32 %or12, ptr %x, align 4
  %18 = load i32, ptr %u, align 4
  %xor13 = xor i32 %18, 47
  %sub14 = sub i32 0, %xor13
  %shr15 = lshr i32 %sub14, 8
  %not16 = xor i32 %shr15, -1
  %and17 = and i32 %not16, 63
  %19 = load i32, ptr %x, align 4
  %or18 = or i32 %19, %and17
  store i32 %or18, ptr %x, align 4
  %20 = load i32, ptr %x, align 4
  %21 = load i32, ptr %x, align 4
  %cmp19 = icmp eq i32 %21, 0
  br i1 %cmp19, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  %22 = load i32, ptr %u, align 4
  %xor20 = xor i32 %22, 65
  %sub21 = sub i32 0, %xor20
  %shr22 = lshr i32 %sub21, 8
  %and23 = and i32 %shr22, 255
  br label %cond.end

cond.false:                                       ; preds = %for.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %and23, %cond.true ], [ 0, %cond.false ]
  %or24 = or i32 %20, %cond
  ret i32 %or24
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
