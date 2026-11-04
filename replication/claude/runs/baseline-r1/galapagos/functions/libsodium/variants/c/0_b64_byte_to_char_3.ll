; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_3.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
  %m = alloca [3 x i32], align 4
  %off = alloca [3 x i32], align 4
  %r = alloca i32, align 4
  %prev = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  store i32 0, ptr %r, align 4
  store i32 255, ptr %prev, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %arrayidx = getelementptr inbounds [3 x i32], ptr %m, i64 0, i64 0
  store i32 %and, ptr %arrayidx, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  %arrayidx4 = getelementptr inbounds [3 x i32], ptr %m, i64 0, i64 1
  store i32 %and3, ptr %arrayidx4, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub5 = sub i32 %2, 62
  %shr6 = lshr i32 %sub5, 8
  %and7 = and i32 %shr6, 255
  %arrayidx8 = getelementptr inbounds [3 x i32], ptr %m, i64 0, i64 2
  store i32 %and7, ptr %arrayidx8, align 4
  %3 = load i32, ptr %x.addr, align 4
  %add = add i32 %3, 65
  %arrayidx9 = getelementptr inbounds [3 x i32], ptr %off, i64 0, i64 0
  store i32 %add, ptr %arrayidx9, align 4
  %4 = load i32, ptr %x.addr, align 4
  %add10 = add i32 %4, 71
  %arrayidx11 = getelementptr inbounds [3 x i32], ptr %off, i64 0, i64 1
  store i32 %add10, ptr %arrayidx11, align 4
  %5 = load i32, ptr %x.addr, align 4
  %add12 = add i32 %5, -4
  %arrayidx13 = getelementptr inbounds [3 x i32], ptr %off, i64 0, i64 2
  store i32 %add12, ptr %arrayidx13, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %6, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i32, ptr %prev, align 4
  %8 = load i32, ptr %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx14 = getelementptr inbounds [3 x i32], ptr %m, i64 0, i64 %idxprom
  %9 = load i32, ptr %arrayidx14, align 4
  %and15 = and i32 %7, %9
  %10 = load i32, ptr %i, align 4
  %idxprom16 = sext i32 %10 to i64
  %arrayidx17 = getelementptr inbounds [3 x i32], ptr %off, i64 0, i64 %idxprom16
  %11 = load i32, ptr %arrayidx17, align 4
  %and18 = and i32 %and15, %11
  %12 = load i32, ptr %r, align 4
  %or = or i32 %12, %and18
  store i32 %or, ptr %r, align 4
  %13 = load i32, ptr %i, align 4
  %idxprom19 = sext i32 %13 to i64
  %arrayidx20 = getelementptr inbounds [3 x i32], ptr %m, i64 0, i64 %idxprom19
  %14 = load i32, ptr %arrayidx20, align 4
  %xor = xor i32 %14, 255
  store i32 %xor, ptr %prev, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %15 = load i32, ptr %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %16 = load i32, ptr %x.addr, align 4
  %xor21 = xor i32 %16, 62
  %sub22 = sub i32 0, %xor21
  %shr23 = lshr i32 %sub22, 8
  %and24 = and i32 %shr23, 255
  %xor25 = xor i32 %and24, 255
  %and26 = and i32 %xor25, 43
  %17 = load i32, ptr %r, align 4
  %or27 = or i32 %17, %and26
  store i32 %or27, ptr %r, align 4
  %18 = load i32, ptr %x.addr, align 4
  %xor28 = xor i32 %18, 63
  %sub29 = sub i32 0, %xor28
  %shr30 = lshr i32 %sub29, 8
  %and31 = and i32 %shr30, 255
  %xor32 = xor i32 %and31, 255
  %and33 = and i32 %xor32, 47
  %19 = load i32, ptr %r, align 4
  %or34 = or i32 %19, %and33
  store i32 %or34, ptr %r, align 4
  %20 = load i32, ptr %r, align 4
  ret i32 %20
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
