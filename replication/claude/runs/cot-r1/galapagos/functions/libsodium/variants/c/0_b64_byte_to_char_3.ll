; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_3.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b64_byte_to_char.lim = internal constant [3 x i32] [i32 26, i32 52, i32 62], align 4
@b64_byte_to_char.off = internal constant [3 x i32] [i32 65, i32 71, i32 -4], align 4
@b64_byte_to_char.eqv = internal constant [2 x i32] [i32 62, i32 63], align 4
@b64_byte_to_char.chr = internal constant [2 x i32] [i32 43, i32 47], align 4

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
  %r = alloca i32, align 4
  %prev = alloca i32, align 4
  %m = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  store i32 0, ptr %r, align 4
  store i32 255, ptr %prev, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %x.addr, align 4
  %2 = load i32, ptr %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [3 x i32], ptr @b64_byte_to_char.lim, i64 0, i64 %idxprom
  %3 = load i32, ptr %arrayidx, align 4
  %sub = sub i32 %1, %3
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %m, align 4
  %4 = load i32, ptr %prev, align 4
  %5 = load i32, ptr %m, align 4
  %and1 = and i32 %4, %5
  %6 = load i32, ptr %x.addr, align 4
  %7 = load i32, ptr %i, align 4
  %idxprom2 = sext i32 %7 to i64
  %arrayidx3 = getelementptr inbounds [3 x i32], ptr @b64_byte_to_char.off, i64 0, i64 %idxprom2
  %8 = load i32, ptr %arrayidx3, align 4
  %add = add i32 %6, %8
  %and4 = and i32 %and1, %add
  %9 = load i32, ptr %r, align 4
  %or = or i32 %9, %and4
  store i32 %or, ptr %r, align 4
  %10 = load i32, ptr %m, align 4
  %xor = xor i32 %10, 255
  store i32 %xor, ptr %prev, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, ptr %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %i, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc19, %for.end
  %12 = load i32, ptr %i, align 4
  %cmp6 = icmp slt i32 %12, 2
  br i1 %cmp6, label %for.body7, label %for.end21

for.body7:                                        ; preds = %for.cond5
  %13 = load i32, ptr %x.addr, align 4
  %14 = load i32, ptr %i, align 4
  %idxprom8 = sext i32 %14 to i64
  %arrayidx9 = getelementptr inbounds [2 x i32], ptr @b64_byte_to_char.eqv, i64 0, i64 %idxprom8
  %15 = load i32, ptr %arrayidx9, align 4
  %xor10 = xor i32 %13, %15
  %sub11 = sub i32 0, %xor10
  %shr12 = lshr i32 %sub11, 8
  %and13 = and i32 %shr12, 255
  %xor14 = xor i32 %and13, 255
  %16 = load i32, ptr %i, align 4
  %idxprom15 = sext i32 %16 to i64
  %arrayidx16 = getelementptr inbounds [2 x i32], ptr @b64_byte_to_char.chr, i64 0, i64 %idxprom15
  %17 = load i32, ptr %arrayidx16, align 4
  %and17 = and i32 %xor14, %17
  %18 = load i32, ptr %r, align 4
  %or18 = or i32 %18, %and17
  store i32 %or18, ptr %r, align 4
  br label %for.inc19

for.inc19:                                        ; preds = %for.body7
  %19 = load i32, ptr %i, align 4
  %inc20 = add nsw i32 %19, 1
  store i32 %inc20, ptr %i, align 4
  br label %for.cond5, !llvm.loop !8

for.end21:                                        ; preds = %for.cond5
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
!8 = distinct !{!8, !7}
