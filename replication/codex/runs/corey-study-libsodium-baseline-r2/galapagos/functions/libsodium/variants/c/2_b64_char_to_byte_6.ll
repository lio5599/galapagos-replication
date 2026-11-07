; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/2_b64_char_to_byte_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/2_b64_char_to_byte_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.b64_char_to_byte.ranges = private unnamed_addr constant [3 x [3 x i32]] [[3 x i32] [i32 48, i32 57, i32 52], [3 x i32] [i32 97, i32 122, i32 26], [3 x i32] [i32 65, i32 90, i32 0]], align 16

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
  %ranges = alloca [3 x [3 x i32]], align 16
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  %lower = alloca i32, align 4
  %upper = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %ranges, ptr align 16 @__const.b64_char_to_byte.ranges, i64 36, i1 false)
  %1 = load i32, ptr %u, align 4
  %xor = xor i32 %1, 47
  %sub = sub i32 0, %xor
  %shr = lshr i32 %sub, 8
  %not = xor i32 %shr, -1
  %and = and i32 %not, 63
  %2 = load i32, ptr %u, align 4
  %xor1 = xor i32 %2, 43
  %sub2 = sub i32 0, %xor1
  %shr3 = lshr i32 %sub2, 8
  %not4 = xor i32 %shr3, -1
  %and5 = and i32 %not4, 62
  %or = or i32 %and, %and5
  store i32 %or, ptr %x, align 4
  store i32 3, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %3 = load i32, ptr %i, align 4
  %cmp = icmp ne i32 %3, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i32, ptr %i, align 4
  %dec = add i32 %4, -1
  store i32 %dec, ptr %i, align 4
  %5 = load i32, ptr %u, align 4
  %6 = load i32, ptr %i, align 4
  %idxprom = zext i32 %6 to i64
  %arrayidx = getelementptr inbounds [3 x [3 x i32]], ptr %ranges, i64 0, i64 %idxprom
  %arrayidx6 = getelementptr inbounds [3 x i32], ptr %arrayidx, i64 0, i64 0
  %7 = load i32, ptr %arrayidx6, align 4
  %sub7 = sub i32 %5, %7
  store i32 %sub7, ptr %lower, align 4
  %8 = load i32, ptr %i, align 4
  %idxprom8 = zext i32 %8 to i64
  %arrayidx9 = getelementptr inbounds [3 x [3 x i32]], ptr %ranges, i64 0, i64 %idxprom8
  %arrayidx10 = getelementptr inbounds [3 x i32], ptr %arrayidx9, i64 0, i64 1
  %9 = load i32, ptr %arrayidx10, align 4
  %10 = load i32, ptr %u, align 4
  %sub11 = sub i32 %9, %10
  store i32 %sub11, ptr %upper, align 4
  %11 = load i32, ptr %lower, align 4
  %12 = load i32, ptr %upper, align 4
  %or12 = or i32 %11, %12
  %shr13 = lshr i32 %or12, 8
  %not14 = xor i32 %shr13, -1
  %and15 = and i32 %not14, 255
  %13 = load i32, ptr %lower, align 4
  %14 = load i32, ptr %i, align 4
  %idxprom16 = zext i32 %14 to i64
  %arrayidx17 = getelementptr inbounds [3 x [3 x i32]], ptr %ranges, i64 0, i64 %idxprom16
  %arrayidx18 = getelementptr inbounds [3 x i32], ptr %arrayidx17, i64 0, i64 2
  %15 = load i32, ptr %arrayidx18, align 4
  %add = add i32 %13, %15
  %and19 = and i32 %and15, %add
  %16 = load i32, ptr %x, align 4
  %or20 = or i32 %16, %and19
  store i32 %or20, ptr %x, align 4
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %cmp21 = icmp eq i32 %18, 0
  %conv = zext i1 %cmp21 to i32
  %19 = load i32, ptr %u, align 4
  %xor22 = xor i32 %19, 65
  %sub23 = sub i32 0, %xor22
  %shr24 = lshr i32 %sub23, 8
  %and25 = and i32 %shr24, 255
  %mul = mul i32 %conv, %and25
  %add26 = add i32 %17, %mul
  ret i32 %add26
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
